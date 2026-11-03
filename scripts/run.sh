#!/usr/bin/env bash
# run.sh — FreeLang 파일 하나를 C로 바꾸고, 빌드하고, 실행합니다.
# 사용법: scripts/run.sh examples/01-variables.fl
# 먼저 scripts/install.sh 로 컴파일러를 준비하세요.
set -Eeuo pipefail
SRC="${1:-}"
[[ -n "$SRC" ]] || { echo "사용법: scripts/run.sh <파일.fl>" >&2; exit 1; }
[[ -f "$SRC" ]] || { echo "✖ 파일이 없어요: $SRC" >&2; exit 1; }
FL_HOME="${FL_HOME:-$HOME/.freelang}"
FX="$FL_HOME/freelang-v11-fx"
FLC="$FL_HOME/bin/flc"
[[ -x "$FLC" ]] || { echo "✖ 컴파일러가 없어요. 먼저 scripts/install.sh 를 실행하세요." >&2; exit 1; }
WORK="$(mktemp -d "${TMPDIR:-/tmp}/fl-run.XXXXXX")"
trap 'rm -rf -- "$WORK"' EXIT
if ! "$FLC" "$SRC" "$WORK/out.c" >"$WORK/flc.log" 2>&1; then
  echo "✖ FreeLang 컴파일 실패: $SRC" >&2; grep -v '^\[FL Warn\]' "$WORK/flc.log" >&2 || true; exit 1
fi
if ! gcc -O2 -w -I "$FX/runtime" $(cat "$FL_HOME/cflags") -o "$WORK/app" "$WORK/out.c" \
     $(cat "$FL_HOME/app-srcs") $(cat "$FL_HOME/ldflags") 2>"$WORK/gcc.log"; then
  echo "✖ C 빌드 실패 (없는 함수 이름을 썼을 수 있어요):" >&2; grep -m5 'error' "$WORK/gcc.log" >&2 || true; exit 1
fi
"$WORK/app"
