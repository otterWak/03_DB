-- 테이블 삭제

-- DROP TABLE 테이블명 [CASCADE CONSTRAINTS];

-- 1) 관계가 형성되지 않은 테이블 삭제
DROP TABLE DCOPY;


-- 2) 관계가 형성된 테이블 삭제
CREATE TABLE TB1(
	TB1_PK NUMBER PRIMARY KEY,
	TB1_COL NUMBER	
); -- 부모 테이블

CREATE TABLE TB2(
	TB2_PK NUMBER PRIMARY KEY,
	TB2_COL NUMBER REFERENCES TB1	
); -- 자식 테이블

-- TB1에 샘플 데이터 삽입
INSERT INTO TB1 VALUES(1, 100);
INSERT INTO TB1 VALUES(2, 200);
INSERT INTO TB1 VALUES(3, 300);

COMMIT;

-- TB2에 샘플 데이터 삽입
INSERT INTO TB2 VALUES(11, 1);
INSERT INTO TB2 VALUES(12, 2);
INSERT INTO TB2 VALUES(13, 3);

-- TB1과 TB2는 부모-자식 테이블 관계 형성

-- 부모인 TB1 테이블을 삭제하려고 할 때
DROP TABLE TB1;
-- SQL Error [2449] [72000]: 
-- ORA-02449: 외래 키에 의해 참조되는 고유/기본 키가 테이블에 있습니다
--> 해결방법
-- 1) 자식, 부모테이블 순서로 삭제
-- 2) ALTER를 이용해서 FK 제약조건 삭제 후 TB1 삭제
-- 3) DROP TABLE 삭제옵션 CASCADE CONSTRAINTS 사용
	  --> CASCADE CONSTRAINTS : 삭제하려는 테이블과 연결된 FK 제약조건을 모두 삭제

DROP TABLE TB1 CASCADE CONSTRAINTS; -- 테이블 삭제 시 FK 관계도 모두 삭제

SELECT * FROM TB1; -- 삭제 확인 됨

SELECT * FROM TB2; -- TB2 테이블만 아무 관계 없이 남게 됨

---------------------------------------------------------------------------------------------------------

/*DDL 주의 사항*/
-- 1) DDL은 COMMIT/ROLLBACK이 되지 않는다(CREATE/ALTER/DROP은 바로 반영)

-- 2) DDL과 DML 구문 섞어서 수행하면 안된다!
-- DDL(CREATE, ALTER,  DROP   : 객체 생성/수정/삭제)
-- DML(INSERT, UPDATE, DELETE : 데이터(행) 추가/갱신/삭제)
--> DDL은 수행 시 존재하고 있는 트랜잭션을 모두 DB에 강제 COMMIT 시킴
--> DDL이 종료된 후 DML 구문을 수행할 수 있도록 권장!

SELECT * FROM TB2;

COMMIT;

-- DML
INSERT INTO TB2 VALUES (14, 4);
INSERT INTO TB2 VALUES (15, 5);
SELECT * FROM TB2;


-- 컬럼명 변경 DDL
ALTER TABLE TB2 RENAME COLUMN TB2_COL TO TB2_COLUMN;


ROLLBACK;
SELECT * FROM TB2;
-- 롤백이 안된다.. 위에서 DDL구문 중 ALTER를 사용해서 그 시점에 COMMIT 됨

















































