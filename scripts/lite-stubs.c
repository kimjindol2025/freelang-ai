/* lite-stubs.c — 가벼운 설치용 대체 함수
 * sqlite3 / libcurl 개발 헤더가 없을 때 install.sh가 runtime/sqlite.c,
 * runtime/http_client.c 대신 이 파일을 넣어 빌드합니다.
 * 기본 예제(출력·함수·벡터·맵·파일)는 그대로 동작하고,
 * sqlite-* / http-get 같은 기능을 부르면 안내 문구를 띄우고 멈춥니다.
 * 모든 기능이 필요하면 헤더를 설치한 뒤 scripts/install.sh 를 다시 실행하세요.
 */
#include <stdio.h>
#include <stdlib.h>
#include "runtime.h"

static FLValue fl_lite_missing(const char *what) {
  fprintf(stderr, "[FreeLang lite] %s 기능은 가벼운 설치에 들어 있지 않아요. "
                  "개발 헤더를 설치한 뒤 scripts/install.sh 를 다시 실행하세요.\n", what);
  exit(3);
}

FLValue fxb_sqlite_open(FLValue a) { (void)a; return fl_lite_missing("sqlite"); }
FLValue fxb_sqlite_query(FLValue a, FLValue b) { (void)a; (void)b; return fl_lite_missing("sqlite"); }
FLValue fxb_sqlite_exec(FLValue a, FLValue b) { (void)a; (void)b; return fl_lite_missing("sqlite"); }
FLValue fxb_sqlite_one(FLValue a, FLValue b) { (void)a; (void)b; return fl_lite_missing("sqlite"); }
FLValue fxb_sqlite_query_p(FLValue a, FLValue b, FLValue c) { (void)a; (void)b; (void)c; return fl_lite_missing("sqlite"); }
FLValue fxb_sqlite_exec_p(FLValue a, FLValue b, FLValue c) { (void)a; (void)b; (void)c; return fl_lite_missing("sqlite"); }
FLValue fxb_sqlite_close(FLValue a) { (void)a; return fl_lite_missing("sqlite"); }

FLValue http_get(FLValue a) { (void)a; return fl_lite_missing("http client"); }
FLValue http_post(FLValue a, FLValue b) { (void)a; (void)b; return fl_lite_missing("http client"); }
FLValue http_put(FLValue a, FLValue b) { (void)a; (void)b; return fl_lite_missing("http client"); }
FLValue http_del(FLValue a) { (void)a; return fl_lite_missing("http client"); }
FLValue http_patch(FLValue a, FLValue b) { (void)a; (void)b; return fl_lite_missing("http client"); }
FLValue http_body(FLValue a) { (void)a; return fl_lite_missing("http client"); }
FLValue http_status(FLValue a) { (void)a; return fl_lite_missing("http client"); }
FLValue http_ok_p(FLValue a) { (void)a; return fl_lite_missing("http client"); }
