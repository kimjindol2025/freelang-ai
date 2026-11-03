<p align="center">
  <img src="docs/mark.svg" width="72" height="72" alt="FreeLang">
</p>

<h1 align="center">FreeLang</h1>

<p align="center">
  <strong>AI가 잡고 쓰는 Lisp.</strong><br>
  A Lisp-like language for people and models that write programs together.
</p>

<p align="center">
  <a href="https://kimjindol2025.github.io/freelang-ai/">Homepage</a> ·
  <a href="examples">Examples</a> ·
  <a href="docs/getting-started.md">Getting started</a> ·
  <a href="https://github.com/kimjindol2025/freelang-v11">Compiler</a>
</p>

---

Gleam, Elixir, Zig, Clojure, Fennel의 첫 페이지는 한 문장 → 바로 코드 → 주장마다 예시입니다. 이 저장소도 그 뼈대입니다. 컴파일러 전체가 아니라 **언어의 얼굴**만 둡니다.

```freelang
(println "Hello from FL!")
(println (+ 1 2 3))
```

## Why

**Lisp.** 코드가 데이터입니다. 생성하고, 읽고, 바꾸는 길이 같습니다.

```freelang
(defn greet [name]
  (str "Hello, " name "!"))
```

**For models.** 문법이 작고 파일이 짧습니다. 에이전트가 한 화면에 담습니다.

```freelang
(defn factorial [n]
  (if (<= n 1)
    1
    (* n (factorial (- n 1)))))
```

**Real work.** 벡터, 맵, 함수. 구현은 개발 저장소에 있습니다.

```freelang
(define nums [1 2 3 4])
(define person {"name" "Kim" "lang" "FreeLang"})
```

## This repo

| Path | What |
|------|------|
| [docs/index.html](docs/index.html) | Homepage |
| [examples/hello.fl](examples/hello.fl) | Print and arithmetic |
| [examples/factorial.fl](examples/factorial.fl) | Recursion |
| [examples/collections.fl](examples/collections.fl) | Vectors and maps |
| [LICENSE](LICENSE) | MIT |

개발 파일(`src/`, `runtime/`, `tests/`)은 여기 없습니다. 그건 [freelang-v11](https://github.com/kimjindol2025/freelang-v11)입니다.

## Links

- Homepage: https://kimjindol2025.github.io/freelang-ai/
- Language core: https://github.com/kimjindol2025/freelang-v11
