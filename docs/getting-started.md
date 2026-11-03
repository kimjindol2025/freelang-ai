# Getting started

This repository is the public introduction to FreeLang.
The compiler and runtime live in the development repo.

## What to read first

1. [README](../README.md) — one-page overview
2. `examples/hello.fl` — print and arithmetic
3. `examples/factorial.fl` — recursive function
4. `examples/collections.fl` — vectors and maps

## Syntax in short

FreeLang is Lisp-like. Code is lists in parentheses.

```freelang
(println "Hello from FL!")
(+ 1 2 3)
(defn square [n] (* n n))
```

Vectors use `[]`. Maps use `{}`.

```freelang
[1 2 3]
{"name" "Kim"}
```

## Implementation

Language core, compiler, and tests: [kimjindol2025/freelang-v11](https://github.com/kimjindol2025/freelang-v11)
