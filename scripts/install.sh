#!/usr/bin/env bash
# install.sh — FreeLang FX 컴파일러를 받아서 직접 빌드합니다. (node·sudo 필요 없음)
# 필요: git, gcc, 그리고 libsqlite3 / libssl / libcurl 개발 헤더
# 사용법: scripts/install.sh            (기본 위치: ~/.freelang)
set -Eeuo pipefail
FL_HOME="${FL_HOME:-$HOME/.freelang}"
REPO="https://github.com/kimjindol2025/freelang-v11-fx"
PIN="${FL_PIN:-1d217f53a8aade8a288c0dcad0a1ba23b610f102}"   # 2026-11-03 자체 컴파일 검증을 한 커밋
FX="$FL_HOME/freelang-v11-fx"
mkdir -p "$FL_HOME/bin"
if [[ ! -d "$FX/.git" ]]; then git clone "$REPO" "$FX"; fi
git -C "$FX" fetch -q origin
git -C "$FX" checkout -q "$PIN"
R="$FX/runtime"
ALL="core collection io math error process json aliases user-fns cgc-bridge gc http websocket sqlite mariadb debug http_client regex smtp sse"
APP="core collection io math error process json aliases user-fns gc http websocket sqlite mariadb debug http_client regex smtp sse"
for f in $APP; do printf '%s ' "$R/$f.c"; done > "$FL_HOME/app-srcs"
: "${FL_CFLAGS:=}"; printf '%s' "$FL_CFLAGS" > "$FL_HOME/cflags"
: "${FL_LDFLAGS:=-lm -lpthread -ldl -lsqlite3 -lssl -lcrypto -lcurl}"; printf '%s' "$FL_LDFLAGS" > "$FL_HOME/ldflags"
SRCS=""; for f in $ALL; do SRCS="$SRCS $R/$f.c"; done
echo "[1/3] stage0 빌드"
gcc -O2 -w -I "$R" $FL_CFLAGS -o "$FL_HOME/bin/stage0" "$FX/bootstrap/stage0.c" $SRCS $FL_LDFLAGS
echo "[2/3] stage0 → stage1 (컴파일러가 자기 소스를 컴파일)"
"$FL_HOME/bin/stage0" "$FX/self/cgc-main.fl" "$FL_HOME/stage1.c" >/dev/null 2>&1
gcc -O2 -w -I "$R" $FL_CFLAGS -o "$FL_HOME/bin/flc" "$FL_HOME/stage1.c" $SRCS $FL_LDFLAGS
echo "[3/3] 확인"
"$FL_HOME/bin/flc" "$FX/self/cgc-main.fl" "$FL_HOME/stage2.c" >/dev/null 2>&1
if cmp -s "$FL_HOME/stage1.c" "$FL_HOME/stage2.c"; then echo "stage1 == stage2  같음"; else echo "stage1 != stage2  다름" >&2; exit 1; fi
sha256sum "$FL_HOME/stage1.c" "$FL_HOME/stage2.c"
echo "완료: $FL_HOME/bin/flc"
