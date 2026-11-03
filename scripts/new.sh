#!/usr/bin/env bash
# new.sh — 새 FreeLang 프로젝트 폴더를 만듭니다. (main.fl 포함)
# 사용법: scripts/new.sh my-app
set -Eeuo pipefail
NAME="${1:-}"
[[ -n "$NAME" ]] || { echo "사용법: scripts/new.sh <프로젝트이름>" >&2; exit 1; }
[[ ! -e "$NAME" ]] || { echo "✖ 이미 있어요: $NAME" >&2; exit 1; }
HERE="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
mkdir -p "$NAME"
cat > "$NAME/main.fl" <<'FL'
;; main.fl — 내 첫 FreeLang 프로그램
(defn greet [$who]
  (str "안녕하세요, " $who "!"))

(println (greet "FreeLang"))
(println (str "1부터 10까지 합: " (reduce (fn [$a $x] (+ $a $x)) 0 [1 2 3 4 5 6 7 8 9 10])))
FL
echo "만들었어요: $NAME/main.fl"
echo "실행: $HERE/run.sh $NAME/main.fl"
