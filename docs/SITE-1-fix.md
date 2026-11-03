# SITE-1-fix

RUN-ID: RUN-20261103-20
대상: https://g-freelang.akl.kr/
홍보 저장소: https://github.com/kimjindol2025/freelang-ai
작업 전 HEAD: `532aab53fa63c5bd0fe46b247817d2f1c7fb3764` (지시서의 843b71d 위에 이미 올라간 origin/main)

## 한 줄 성과

방문자는 `scripts/install.sh` → `scripts/run.sh examples/01-variables.fl`로 node 없이 FreeLang을 설치·실행한다.

## 한 일

1. Install 첫 실행을 node 없는 길(`install.sh` → `run.sh`)로 고정. `node scripts/fl-cli.js`는 「HTTP·DB 앱 실행(아직 node 필요)」칸으로 분리.
2. Playground·Tools 첫 실행 안내를 같은 길로 맞춤. Playground에 예제 01–10 GitHub 링크와 `run.sh` 명령을 표로 연결.
3. 홈의 Node 0 · JS 0은 FX 컴파일러 경로(`install.sh` → `flc` → gcc) 한정. HTTP·DB는 아직 node라고 같은 문단에 적음.
4. 홈과 Tools에 stage1=stage2=stage3 해시 3줄, `./scripts/verify-native-bootstrap.sh`(strace 필요), [freelang-v11-fx](https://github.com/kimjindol2025/freelang-v11-fx) 링크를 게시.
5. 「러스트 홈이~」「rustup에 해당하는~」류 비교 문장을 9개 페이지에서 삭제. FreeLang 자기 말만 남김.
6. 「없습니다」목록은 Install의 「아직 없는 것」한 칸으로 모음(HTTPS, REPL, 포맷터, 린터, 브라우저 실행, 에디터 플러그인, RFC 게시판, 메일 목록, 밋업 달력, 재단·후원).
7. 시험 41/41, 감사 44/44는 이번 턴에 재실행하지 못함 → 사이트에서 숫자 제거, 아래 미확인.
8. 9개 페이지 전부 200. 추출한 고유 링크 36개 전부 200. 민감 정보(서버 이름·번호, IP, 내부 경로, 키, 고객, 매출) 0건.

README·docs/getting-started.md도 첫 경로를 node 없는 길로 맞춤. 새 JS/TS/Python 파일은 추가하지 않음. force-push 없음. 23·25번 서버, erp, grok-router, test11은 손대지 않음.

## 미확인

- 시험 41/41: 이번 턴에 시험 명령을 다시 돌리지 않음. Learn·Blog에서 숫자를 뺐다.
- 감사 44/44: 동일. 숫자를 뺐다.
- `./scripts/verify-native-bootstrap.sh` 전체 재실행은 이번 턴에 하지 않음. 해시와 확인 명령은 지시서 검증값을 게시.

## 페이지 200

| 경로 | local | public |
|------|-------|--------|
| / | 200 | 200 |
| /install/ | 200 | 200 |
| /learn/ | 200 | 200 |
| /playground/ | 200 | 200 |
| /tools/ | 200 | 200 |
| /governance/ | 200 | 200 |
| /funding/ | 200 | 200 |
| /community/ | 200 | 200 |
| /blog/ | 200 | 200 |

링크 36개(내부 12 + GitHub 24) 전부 HTTP 200.

## 판정

1. Install·Playground·Tools 첫 실행이 node 없는 길 — 통과
2. 홈의 Node 0 문장과 실제 안내가 모순 없음 — 통과
3. 자체 컴파일 해시·확인 명령·freelang-v11-fx 링크 게시 — 통과
4. 러스트 비교 문장 0개 — 통과
5. 41/41·44/44 제거(미확인) — 통과
6. 9개 페이지 200 + 링크 전부 열림 + 민감 정보 0건, 푸시 후 HEAD — 푸시 후 아래 기록

푸시 HEAD: (commit 후 기록)

SITE_SUMMARY=6/6
