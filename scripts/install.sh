#!/usr/bin/env bash
# install.sh — FreeLang FX 컴파일러를 받아서 직접 빌드합니다. (node·sudo 필요 없음)
# 꼭 필요: git, gcc, OpenSSL 개발 헤더
# 있으면 좋음: sqlite3 · libcurl 개발 헤더 (없으면 "가벼운 설치"로 기본 예제는 모두 동작)
# 사용법: scripts/install.sh            (기본 위치: ~/.freelang, 바꾸려면 FL_HOME=경로)
set -Eeuo pipefail
HERE="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
FL_HOME="${FL_HOME:-$HOME/.freelang}"
REPO="https://github.com/kimjindol2025/freelang-v11-fx"
PIN="${FL_PIN:-1d217f53a8aade8a288c0dcad0a1ba23b610f102}"   # 2026-11-03 자체 컴파일 검증을 한 커밋
FX="$FL_HOME/freelang-v11-fx"
: "${FL_CFLAGS:=}"

has_header() { printf '#include <%s>\n' "$1" | gcc $FL_CFLAGS -E -x c - >/dev/null 2>&1; }
pkg_hint() {
  echo "  Debian/Ubuntu : sudo apt install $1"
  echo "  Fedora/RHEL   : sudo dnf install $2"
  echo "  macOS (brew)  : brew install $3"
}

echo "[0/3] 준비물 확인"
missing=0
for cmd in git gcc; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "✖ '$cmd' 이(가) 없어요. 설치 방법:"; pkg_hint "git gcc" "git gcc" "git gcc"; missing=1
  fi
done
[[ $missing -eq 0 ]] || exit 1
if ! has_header openssl/ssl.h; then
  echo "✖ OpenSSL 개발 헤더(openssl/ssl.h)가 없어요. 설치 방법:"
  pkg_hint "libssl-dev" "openssl-devel" "openssl"
  echo "  (brew를 쓰면: FL_CFLAGS=\"-I\$(brew --prefix openssl)/include\" FL_LDFLAGS=\"-L\$(brew --prefix openssl)/lib\" 로 다시 실행)"
  exit 1
fi
LITE=0
if has_header sqlite3.h && has_header curl/curl.h; then
  echo "✔ 전체 설치 (sqlite · http 기능 포함)"
else
  LITE=1
  echo "ℹ sqlite3 / libcurl 개발 헤더가 없어 '가벼운 설치'로 진행해요."
  echo "  기본 예제는 모두 동작합니다. sqlite·http 기능까지 쓰려면 설치 후 다시 실행하세요:"
  pkg_hint "libsqlite3-dev libcurl4-openssl-dev" "sqlite-devel libcurl-devel" "sqlite curl"
fi

mkdir -p "$FL_HOME/bin"
if [[ ! -d "$FX/.git" ]]; then git clone -q "$REPO" "$FX"; fi
git -C "$FX" fetch -q origin
git -C "$FX" -c advice.detachedHead=false checkout -q "$PIN"
R="$FX/runtime"
COMMON="core collection io math error process json aliases user-fns gc http websocket mariadb debug regex smtp sse"
if [[ $LITE -eq 0 ]]; then
  EXTRA="$R/sqlite.c $R/http_client.c"
  DEFAULT_LD="-lm -lpthread -ldl -lsqlite3 -lssl -lcrypto -lcurl"
else
  cp "$HERE/lite-stubs.c" "$FL_HOME/lite-stubs.c"
  EXTRA="$FL_HOME/lite-stubs.c"
  DEFAULT_LD="-lm -lpthread -ldl -lssl -lcrypto"
fi
: "${FL_LDFLAGS:=$DEFAULT_LD}"
APP_SRCS=""; for f in $COMMON; do APP_SRCS="$APP_SRCS $R/$f.c"; done; APP_SRCS="$APP_SRCS $EXTRA"
printf '%s' "$APP_SRCS" > "$FL_HOME/app-srcs"
printf '%s' "$FL_CFLAGS" > "$FL_HOME/cflags"
printf '%s' "$FL_LDFLAGS" > "$FL_HOME/ldflags"
printf '%s' "$([[ $LITE -eq 1 ]] && echo lite || echo full)" > "$FL_HOME/mode"
CC_SRCS="$APP_SRCS $R/cgc-bridge.c"

echo "[1/3] stage0 빌드 (1~2분 걸릴 수 있어요)"
gcc -O2 -w -I "$R" $FL_CFLAGS -o "$FL_HOME/bin/stage0" "$FX/bootstrap/stage0.c" $CC_SRCS $FL_LDFLAGS
echo "[2/3] stage0 → stage1 (컴파일러가 자기 소스를 컴파일)"
"$FL_HOME/bin/stage0" "$FX/self/cgc-main.fl" "$FL_HOME/stage1.c" >/dev/null 2>&1
gcc -O2 -w -I "$R" $FL_CFLAGS -o "$FL_HOME/bin/flc" "$FL_HOME/stage1.c" $CC_SRCS $FL_LDFLAGS
echo "[3/3] 확인 (stage1이 다시 자기를 컴파일)"
"$FL_HOME/bin/flc" "$FX/self/cgc-main.fl" "$FL_HOME/stage2.c" >/dev/null 2>&1
if cmp -s "$FL_HOME/stage1.c" "$FL_HOME/stage2.c"; then echo "stage1 == stage2  같음"; else echo "✖ stage1 != stage2  다름" >&2; exit 1; fi
sha256sum "$FL_HOME/stage1.c" "$FL_HOME/stage2.c" | sed "s#$FL_HOME/##"
echo "완료: $FL_HOME/bin/flc  ($(cat "$FL_HOME/mode") 설치)"
echo "다음: scripts/run.sh examples/01-variables.fl"
