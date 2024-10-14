SELECT * FROM TB_CLASS;
SELECT * FROM TB_CLASS_PROFESSOR tcp ;
SELECT * FROM TB_DEPARTMENT td ;
SELECT * FROM TB_GRADE tg ;
SELECT * FROM TB_PROFESSOR tp; 
SELECT * FROM TB_STUDENT ;


-- 1. 영어영문학과(학과코드 002) 학생들의 학번과 이름, 입학 년도를
--	  입학 년도가 빠른순으로 표시하는 SQL 문장을 작성하시오
--	  (단, 헤더는 "학번", "이름", "입학년도"가 표시되도록 한다)
SELECT STUDENT_NO 학번, STUDENT_NAME 이름, ENTRANCE_DATE 입학년도
FROM TB_STUDENT
WHERE DEPARTMENT_NO = 002
ORDER BY ENTRANCE_DATE;

-- 2. 춘 기술대학교의 교수 중 이름이 세 글자가 아닌 교수가 두 명 있다고 한다.
--	  그 교수의 이름과 주민번호를 화면에 출력하는 SQL 문장을 작성해보자
SELECT PROFESSOR_NAME , PROFESSOR_SSN 
FROM TB_PROFESSOR 
WHERE PROFESSOR_NAME NOT LIKE '___';

-- 3. 춘 기술대학교의 남자 교수들의 이름과 나이를 출력하는 SQL 문장을 작성하시오
--	  단, 이때 나이가 적은 사람에서 많은 사람 순서로 화면에 출력되도록 만드시오
--	  (단, 교수 중 2000년 이후 출생자는 없으며, 출력 헤더는 "교수이름","나이"로 한다
--	   나이는 '만으로 계산한다')
SELECT PROFESSOR_NAME 교수이름, 2024-(1900 + TO_NUMBER(SUBSTR(PROFESSOR_SSN, 1, 2))) 나이
FROM TB_PROFESSOR
ORDER BY PROFESSOR_SSN DESC ;

-- 4. 교수들의 이름 중 성을 제외한 이름만 출력하는 SQL문장을 작성하시오
--	  출력 헤더는 "이름"이 찍히도록 한다
SELECT SUBSTR(PROFESSOR_NAME,2) 이름 
FROM TB_PROFESSOR;

-- 5. 춘 기술대학교의 재주생 입학자를 구하려고 한다. 어떻게 찾아낼 것인가?
--	  이때, 19살에 입학하면 재수를 하지 않은 것으로 간주한다
SELECT STUDENT_NO , STUDENT_NAME
FROM TB_STUDENT
WHERE TO_NUMBER( SUBSTR(TO_CHAR(ENTRANCE_DATE,'YYYY/MM/DD'),1,4),'9999' )
- (TO_NUMBER( SUBSTR(STUDENT_SSN,1,2), '99' ) + 1900) > 19;

-- 6. 2020년 크리스마스는 무슨 요일인가?
SELECT TO_CHAR(TO_DATE(20201225, 'YYYY/MM/DD'), 'DAY') FROM DUAL;

-- 7. TO_DATE('99/10/11', 'YY/MM/DD'), TO_DATE('49/10/11','YY/MM/DD')은 각각
--	  몇 년 몇 월 몇 일을 의미할까?
--	  또 TO_DATE('99/10/11', 'RR/MM/DD'), ('49/10/11','YY/MM/DD')은 각각
--	  몇 년 몇 월 몇 일을 의미할까?
SELECT TO_DATE('99/10/11', 'YY/MM/DD'), TO_DATE('49/10/11','YY/MM/DD'),
	   TO_DATE('99/10/11', 'RR/MM/DD'), TO_DATE('49/10/11','YY/MM/DD')
FROM DUAL;
-- 2099-10-11 00:00:00.000/2049-10-11 00:00:00.000/1999-10-11 00:00:00.000/2049-10-11 00:00:00.000

--8. 춘 기술대학교의 2000년도 이후 입학자들은 학번이 A로 시작하게 되어있다.
--	 2000 년도 이전 학번을 받은 학생들의 학번과 이름을 보여주는 SQL문장을 작성하시오
SELECT STUDENT_NO , STUDENT_NAME 
FROM TB_STUDENT
WHERE STUDENT_NO NOT LIKE 'A%';

-- 9. 학번이 A517178인 한아름 학생의 학점 촘 쳥점을 구하는 SQL문을 작성하시오
--	  단, 이때 출력 화면의 헤더는 "평점"이라고 찍히게 하고,
--	  점수는 반올림하여 소수점 이하 한 자리까지만 표시한다
SELECT ROUND(AVG(POINT),1) 평점
FROM TB_GRADE
WHERE STUDENT_NO = 'A517178';


-- 10. 학과별 학생수를 구하여 "학과번호", "학생수(명)"의 형태로 헤더를 만들어
--	   결과값이 출력되도록 하시오
SELECT DEPARTMENT_NO , COUNT(DEPARTMENT_NO) 
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1;

-- 11. 지도 교수를 배정받지 못한 학생의 수는 몇 명 정도 되는지 알아내는 SQL문을 작성하시오
SELECT COUNT(*) 
FROM TB_STUDENT
WHERE COACH_PROFESSOR_NO IS NULL;































