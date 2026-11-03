# Getting started

FreeLang is a Lisp. The compiler is native. This repo is the public front door.

## 1. Read three files

- [examples/hello.fl](../examples/hello.fl)
- [examples/factorial.fl](../examples/factorial.fl)
- [examples/collections.fl](../examples/collections.fl)

## 2. Run

Application run path (HTTP/DB included):

```bash
git clone https://github.com/kimjindol2025/freelang-v11.git
cd freelang-v11
node scripts/fl-cli.js run examples/hello.fl
```

`bin/fl` is the native compiler. It is not the app runner.
`fl-repl` and `fl-serve` are not on the native runtime yet.

## 3. Limits to know

- HTTP v0.1, no HTTPS
- Old `node bootstrap.js` / npm flow is `legacy/`
- Tests 41/41, audits 44/44, stage 2 = 3 = 4 fixpoint

## 4. Compiler

https://github.com/kimjindol2025/freelang-v11

## 5. node 없이 (FX 컴파일러)

```bash
scripts/install.sh                      # freelang-v11-fx를 받아 빌드, stage1 == stage2 확인
scripts/run.sh examples/01-variables.fl # .fl 하나를 컴파일해 실행
```

예제 01~10은 이 방법으로 실제 실행해 확인했습니다.
