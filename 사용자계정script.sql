-- 한 줄 주석
/*
 * 범위주석
 * 
 * */


-- 선택한 SQL 수행 : 구문에 커서 두고 CTRL + ENTER
-- 전체 SQL 수행 : alt + x(전체 선택 상태에서 눌러야 됨 ctrl + a)
-- SQL (Structured Query Language , 구조적 질의 언어) :
-- 데이터베이스와 상호작용을 하기 위해 사용하는 표준 언어
-- 데이터의 조회, 삽입, 수정, 삭제 등

-- 새로운 사용자 계정 생성 (sys : 최고 관리자 계정)
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
-- 11G 이전 문법 사용 허용

CREATE USER kh_lhg IDENTIFIED BY kh1234;
-- 계정 생성 구문 (kh_lhg : ID / kh1234 : Password)

GRANT RESOURCE, CONNECT TO kh_lhg;
-- 사용자 계정 권한 부여 설정
-- RESOURCE : 테이블이나 인덱스 같은 DB 객체를 생성할 권한
-- CONNECT : DB에 연결하고 로그인할 수 있는 권한

ALTER USER kh_lhg DEFAULT TABLESPACE SYSTEM QUOTA UNLIMITED ON SYSTEM;
-- 객체가 생성될 수 있는 공간 할당량 무제한 지정

ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER workbook IDENTIFIED BY workbook;
GRANT RESOURCE, CONNECT TO workbook;
ALTER USER workbook DEFAULT TABLESPACE SYSTEM QUOTA UNLIMITED ON SYSTEM;