# FreeLang

Lisp. Native compiler. A language small enough for a model to write, and real enough to compile itself.

```freelang
(println "Hello from FL!")
(defn factorial [n]
  (if (<= n 1) 1 (* n (factorial (- n 1)))))
```

## What it is

**Lisp.** S-expressions. Code is data.

**Native compiler.** v11 is node-free on the execution path. Stage 2 = 3 = 4 fixpoint. Tests 41/41, audits 44/44. Old bootstrap/npm lives in `legacy/`.

**For models.** No silent coercion. Pure code vs I/O. One naming rule (kebab-case). Same input, same output.

## What it does

Strings, regex, files, time, tests, HTTP, DB. HTTP is v0.1. **No HTTPS.**
Apps with HTTP or DB run through `scripts/fl-cli.js`, not `bin/fl`.
Native runtime does not yet provide `fl-repl` or `fl-serve`.

## Start

```bash
git clone https://github.com/kimjindol2025/freelang-v11.git
cd freelang-v11
node scripts/fl-cli.js run examples/hello.fl
```

- Homepage: https://g-freelang.akl.kr/
- Examples: [hello](examples/hello.fl) · [factorial](examples/factorial.fl) · [collections](examples/collections.fl)
- Guide: [docs/getting-started.md](docs/getting-started.md)
- Compiler: https://github.com/kimjindol2025/freelang-v11
