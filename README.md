# FreeLang

Lisp. Native compiler. A language small enough for a model to write, and real enough to compile itself.

```freelang
(println "Hello from FL!")
(defn factorial [n]
  (if (<= n 1) 1 (* n (factorial (- n 1)))))
```

## 5분 시작

node·sudo 없이, 명령 네 줄이면 됩니다. 필요한 것: `git`, `gcc`, OpenSSL 개발 헤더(`libssl-dev`).

```bash
git clone https://github.com/kimjindol2025/freelang-ai && cd freelang-ai
scripts/install.sh                       # 컴파일러 빌드 + 자체 컴파일 확인 (1~3분)
scripts/run.sh examples/01-variables.fl  # 예제 실행
scripts/new.sh my-app && scripts/run.sh my-app/main.fl   # 내 프로젝트 시작
```

예상 출력:

```text
...
stage1 == stage2  같음
완료: ~/.freelang/bin/flc  (full 설치)      ← sqlite·curl 헤더가 없으면 (lite 설치)
FreeLang
2026
42
만들었어요: my-app/main.fl
안녕하세요, FreeLang!
1부터 10까지 합: 55
```

막히면 `scripts/doctor.sh`가 무엇이 빠졌는지와 설치할 패키지 이름을 알려 줍니다.
sqlite3·libcurl 헤더가 없어도 "가벼운 설치(lite)"로 기본 예제는 모두 동작합니다.

## What it is

**Lisp.** S-expressions. Code is data.

**Native compiler.** The FX compiler path (`scripts/install.sh` → `flc` → gcc) is node-free. Stage 1 = 2 = 3 fixpoint. HTTP·DB apps still need node via `scripts/fl-cli.js`.

**For models.** No silent coercion. Pure code vs I/O. One naming rule (kebab-case). Same input, same output.

## What it does

Strings, regex, files, time, tests, HTTP, DB. HTTP is v0.1. **No HTTPS.**
Apps with HTTP or DB run through `scripts/fl-cli.js`, not `bin/fl`.
Native runtime does not yet provide `fl-repl` or `fl-serve`.

## Start

FX 컴파일러를 받아 예제를 돌립니다. node·sudo 필요 없음.

```bash
git clone https://github.com/kimjindol2025/freelang-ai
cd freelang-ai
scripts/install.sh                         # 컴파일러 빌드 + 자체 컴파일 확인
scripts/run.sh examples/01-variables.fl    # 예제 실행
```

필요한 것: `git`, `gcc`, OpenSSL 개발 헤더. sqlite3·libcurl 헤더는 선택(없으면 lite 설치).

HTTP·DB 앱은 아직 node가 필요합니다:

```bash
git clone https://github.com/kimjindol2025/freelang-v11.git
cd freelang-v11
node scripts/fl-cli.js run examples/hello.fl
```

- Homepage: https://g-freelang.akl.kr/
- Examples: [hello](examples/hello.fl) · [factorial](examples/factorial.fl) · [collections](examples/collections.fl)
- Guide: [docs/getting-started.md](docs/getting-started.md)
- Compiler: https://github.com/kimjindol2025/freelang-v11-fx

## 스스로를 컴파일한다는 증거

[freelang-v11-fx](https://github.com/kimjindol2025/freelang-v11-fx)는 `bootstrap/stage0.c` 하나에서 시작해 자기 자신을 다시 컴파일합니다. 1·2·3세대 결과가 한 글자도 다르지 않습니다. Node · npm · JavaScript는 쓰이지 않습니다.

```text
stage1.c  aa8bed315d2bae91630fcff72d7edcafb9afafd84dc357133bb271c3d1bda4fd
stage2.c  aa8bed315d2bae91630fcff72d7edcafb9afafd84dc357133bb271c3d1bda4fd
stage3.c  aa8bed315d2bae91630fcff72d7edcafb9afafd84dc357133bb271c3d1bda4fd
```

직접 확인: `git clone https://github.com/kimjindol2025/freelang-v11-fx && cd freelang-v11-fx && ./scripts/verify-native-bootstrap.sh` (strace 필요)

## 예제 (FX 컴파일러로 실제 실행 확인)

| 파일 | 내용 |
|------|------|
| [01-variables.fl](examples/01-variables.fl) | 변수 (`define`, `let`) |
| [02-functions.fl](examples/02-functions.fl) | 함수 (`defn`, `str`) |
| [03-conditions.fl](examples/03-conditions.fl) | 조건 (`if`, `cond`) |
| [04-loops.fl](examples/04-loops.fl) | 반복과 재귀 (`loop`/`recur`) |
| [05-strings.fl](examples/05-strings.fl) | 문자열 |
| [06-collections.fl](examples/06-collections.fl) | 벡터와 맵 |
| [07-higher-order.fl](examples/07-higher-order.fl) | `map` · `filter` · `reduce` |
| [08-errors.fl](examples/08-errors.fl) | 오류 처리 (`try`/`catch`) |
| [09-files.fl](examples/09-files.fl) | 파일 쓰기 · 읽기 · 지우기 |
| [10-cli-todo.fl](examples/10-cli-todo.fl) | 작은 프로그램: 할 일 목록 |
