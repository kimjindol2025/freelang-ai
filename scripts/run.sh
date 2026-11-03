#!/usr/bin/env bash
# run.sh — FreeLang 파일 하나를 C로 바꾸고, 빌드하고, 실행합니다.
# 사용법: scripts/run.sh examples/01-variables.fl
# 먼저 scripts/install.sh 로 컴파일러를 준비하세요.
set -Eeuo pipefail
SRC="${1:?사용법: scripts/run.sh <파일.fl>}"
FL_HOME="${FL_HOME:-$HOME/.freelang}"
FX="$FL_HOME/freelang-v11-fx"
FLC="$FL_HOME/bin/flc"
[[ -x "$FLC" ]] || { echo "컴파일러가 없어요. 먼저 scripts/install.sh 를 실행하세요." >&2; exit 1; }
WORK="$(mktemp -d "${TMPDIR:-/tmp}/fl-run.XXXXXX")"
trap 'rm -rf -- "$WORK"' EXIT
"$FLC" "$SRC" "$WORK/out.c" >/dev/null
gcc -O2 -w -I "$FX/runtime" $(cat "$FL_HOME/cflags") -o "$WORK/app" "$WORK/out.c" \
  $(cat "$FL_HOME/app-srcs") $(cat "$FL_HOME/ldflags")
"$WORK/app"
