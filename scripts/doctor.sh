#!/usr/bin/env bash
# doctor.sh — FreeLang 설치 상태를 점검합니다.
# 사용법: scripts/doctor.sh
set -uo pipefail
FL_HOME="${FL_HOME:-$HOME/.freelang}"
: "${FL_CFLAGS:=}"
ok=0
chk() { if eval "$2" >/dev/null 2>&1; then echo "✔ $1"; else echo "✖ $1 — $3"; ok=1; fi; }
hdr() { printf '#include <%s>\n' "$1" | gcc $FL_CFLAGS -E -x c - ; }
chk "git"              "command -v git"                 "git 설치 필요"
chk "gcc"              "command -v gcc"                 "gcc 설치 필요"
chk "OpenSSL 헤더"     "hdr openssl/ssl.h"              "libssl-dev / openssl-devel / brew openssl"
hdr sqlite3.h >/dev/null 2>&1 && echo "✔ sqlite3 헤더(선택)" || echo "ℹ sqlite3 헤더(선택) 없음 — 없어도 기본 예제 OK (libsqlite3-dev / sqlite-devel)"
hdr curl/curl.h >/dev/null 2>&1 && echo "✔ libcurl 헤더(선택)" || echo "ℹ libcurl 헤더(선택) 없음 — 없어도 기본 예제 OK (libcurl4-openssl-dev / libcurl-devel)"
chk "컴파일러 flc"     "test -x '$FL_HOME/bin/flc'"     "scripts/install.sh 실행"
[[ -f "$FL_HOME/mode" ]] && echo "ℹ 설치 방식: $(cat "$FL_HOME/mode")"
command -v node >/dev/null 2>&1 && echo "ℹ node가 있지만 FreeLang은 쓰지 않아요." || echo "ℹ node 없음 (필요 없음)"
exit $ok
