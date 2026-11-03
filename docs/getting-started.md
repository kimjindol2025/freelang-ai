# Getting started

This repository is the public face of FreeLang.
The compiler lives in [freelang-v11](https://github.com/kimjindol2025/freelang-v11).

## 1. Read the language

Start with three files. That is the whole intro.

- [examples/hello.fl](../examples/hello.fl) — print and arithmetic
- [examples/factorial.fl](../examples/factorial.fl) — a recursive function
- [examples/collections.fl](../examples/collections.fl) — vectors and maps

## 2. Syntax

Code is lists. Vectors use `[]`. Maps use `{}`.

```freelang
(println "Hello from FL!")
(+ 1 2 3)
(defn square [n] (* n n))
[1 2 3]
{"name" "Kim"}
```

## 3. Compiler

Clone the development repo when you want to run or build:

https://github.com/kimjindol2025/freelang-v11
