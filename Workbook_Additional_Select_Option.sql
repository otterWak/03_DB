SELECT * FROM TB_CLASS;
SELECT * FROM TB_CLASS_PROFESSOR tcp ;
SELECT * FROM TB_DEPARTMENT td ;
SELECT * FROM TB_GRADE tg ;
SELECT * FROM TB_PROFESSOR tp; 
SELECT * FROM TB_STUDENT ;

-- 1. 학생이름과 주소지를 표시하시오.
--	  단, 출력 헤더는 "학생 이름", "주소지"로 하고,
--	  정렬은 이름으로 오름차순 표시하도록 한다.
SELECT STUDENT_NAME "학생 이름", STUDENT_ADDRESS "주소지"
FROM TB_STUDENT
ORDER BY 1;

-- 2. 휴학중인 학생들의 이름과 주민번호를 나이가 적은 순서로 화면에 출력하시오
SELECT STUDENT_NAME , STUDENT_SSN 
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
ORDER BY STUDENT_SSN DESC;

-- 3. 주소지가 강원도나 경기도인 학생들 중
--	  1900년대 학번을 가진 학생들의
--	  이름과 학번, 주소를 이름의 오른차순으로 화면에 출력하시오
--	  단, 출력헤더에는 "학생이름", "학번", "거주지 주소"가 출력되도록 한다
SELECT STUDENT_NAME 학생이름, STUDENT_NO 학번, STUDENT_ADDRESS "거주지 주소"
FROM TB_STUDENT
WHERE STUDENT_NO LIKE '9%'
AND (STUDENT_ADDRESS LIKE '%강원도%' OR STUDENT_ADDRESS LIKE '%경기도%')
ORDER BY 1;

-- 4. 현재 법학과 교수 중 가장 나이가 많은 사람부터 이름을 확인할 수 있는 SQL 문장을 작성하시오
--	  법학과의 학과코드는 학과 테이블을 조회해서 찾아내도록 하자
SELECT PROFESSOR_NAME , PROFESSOR_SSN 
FROM TB_PROFESSOR P
JOIN TB_DEPARTMENT D ON(P.DEPARTMENT_NO = D.DEPARTMENT_NO)
WHERE DEPARTMENT_NAME  = '법학과'
ORDER BY 2;

-- 5. 2004년 2학기에 'C3118100' 과목을 수강한 학생들의 학점을 조회하려고 한다.
--	  학점이 높은 학생부터 표시하고, 학점이 같으면 학번이 낮은 학생부터 표시하는 구문을 작성해보시오.
SELECT STUDENT_NO , POINT
FROM TB_GRADE
WHERE CLASS_NO = 'C3118100'
AND TERM_NO = '200402'
ORDER BY POINT DESC, STUDENT_NO;

-- 6. 학생 번호, 학생 이름, 학과 이름을 학생 이름으로 오름차순 정렬하여 출력하는 SQL 문을 작성하시오
SELECT STUDENT_NO , STUDENT_NAME , DEPARTMENT_NAME
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
ORDER BY 2 DESC;