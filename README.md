# FreeLang

AI-friendly Lisp-like programming language.

FreeLang is a small S-expression language meant to be easy for people and models to read, write, and check. This repository is the public front door: a short README, a license, and a few examples. The compiler lives elsewhere.

## Features

- Lisp-like syntax: code is data in parentheses
- Named functions with `defn`
- Vectors `[]` and maps `{}`
- Small examples that fit in one screen
- Written so an AI can generate and review `.fl` files without a large toolchain dump

## Hello World

```freelang
(println "Hello from FL!")
(println (+ 1 2 3))
```

[examples/hello.fl](examples/hello.fl)

## Functions

```freelang
(defn factorial [n]
  (if (<= n 1)
    1
    (* n (factorial (- n 1)))))

(println (factorial 5))
```

[examples/factorial.fl](examples/factorial.fl)

## Collections

```freelang
(define nums [1 2 3 4])
(println (vec-get nums 0))

(define person {"name" "Kim" "lang" "FreeLang"})
(println (map-get person "name"))
```

[examples/collections.fl](examples/collections.fl)

## Start here

- [Getting started](docs/getting-started.md)
- [MIT License](LICENSE)

## Related

- Development repo (compiler, runtime, tests): [kimjindol2025/freelang-v11](https://github.com/kimjindol2025/freelang-v11)
- This promo repo: [kimjindol2025/freelang-ai](https://github.com/kimjindol2025/freelang-ai)
