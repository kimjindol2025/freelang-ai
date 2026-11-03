# Getting started

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


FX 컴파일러를 받아 예제를 돌립니다. node와 sudo가 필요 없습니다.

```bash
git clone https://github.com/kimjindol2025/freelang-ai
cd freelang-ai
scripts/install.sh
scripts/run.sh examples/01-variables.fl
```

필요한 것: `git`, `gcc`, OpenSSL 개발 헤더. sqlite3·libcurl 헤더는 선택(없으면 lite 설치).

HTTP·DB 앱은 아직 node가 필요합니다. 그 안내는 Install 페이지에 있습니다.

그다음 예제 열 개를 읽거나 사이트를 엽니다.

- https://g-freelang.akl.kr/install/
- https://g-freelang.akl.kr/learn/
- https://g-freelang.akl.kr/playground/
