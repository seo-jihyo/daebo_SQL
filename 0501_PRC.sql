-- COUNT 함수
SELECT COUNT(*), COUNT(HPAGE)
FROM PROFESSOR;
--COUNT(*)의 결과는 NULL을 포함한 결과
--COUNT(HPAGE)의 결과는 NULL을 제외한 결과임

--SUM 함수
--입력된 데이터들의 합계값을 구하는 함수
SET NULL (NULL);
SELECT NAME, BONUS
FROM PROFESSOR;

SELECT COUNT(bonus), SUM(bonus)
FROM PROFESSOR;

--AVG 함수
-- 입력된 값들의 평균값을 구해 주는 함수

--NULL값 자동 제외--
SELECT COUNT(BONUS), SUM(BONUS), AVG(BONUS)
FROM PROFESSOR;

--NULL값을 0으로 변환. 바른 결과
SELECT COUNT(*), SUM(BONUS), AVG(NVL(BONUS,0))
FROM PROFESSOR;

--MAX, NIM 함수
SELECT MAX(SAL), MIN(SAL)
FROM EMP;

SELECT MAX(HIREDATE), MIN(HIREDATE)
FROM EMP;

--STDDEV 함수/ VARIANCE 함수
--STDDEV 함수는 표준 편차를 구하는 함수이고 VARIANCE 함수는 분산을 구하는 함수
SELECT STDDEV(PAY),
        VARIANCE(PAY)
FROM PROFESSOR;

--PROFESSOR 테이블에서 학과별로 교수들의 평균 급여를 출력
SELECT DEPTNO, AVG(NVL(PAY,0))"평균 급여"
FROM PROFESSOR
GROUP BY DEPTNO;

--PROFESSOR 테이블에서 학과별, 직급별로 교수들의 평균 급여를 출력
SELECT DEPTNO, POSITION, AVG(NVL(PAY,0)) "평균 급여"
FROM PROFESSOR
GROUP BY DEPTNO, POSITION;

--GROUP BY 절에는 반드시 칼럼명이 사용되어야 하며 ALIAS는 사용이 불가능합니다.
/*SELECT절에 사용된 그룹함수 이외의 칼럼이나 표현식은 반드시 GROUP BY절에 사용되어야 합니다.
그렇지 않을 경우 아래와 같은 에러가 발생합니다.*/
SELECT DEPTNO,POSITION, AVG(NVL(PAY,0)) "평균급여"
FROM PROFESSOR
GROUP BY DEPTNO;
-- ERROR. GROUP BY 표현식이 아닙니다.

--GROUP BY 절에 사용된 칼럼은 SELECT절에 사용되지 않아도 됩니다.
SELECT DEPTNO, AVG(NVL(PAY,0)) "평균 급여"
FROM PROFESSOR
GROUP BY DEPTNOM POSITION;


--평균 급여가 450 이상인 부서의 부서번호와 평균 급여를 구하세요
SELECT DEPTNO, AVG(NVL(PAY,0))
FROM PROFESSOR
GROUP BY DEPTNO
HAVING AVG(PAY)> 450;

--CUBE 함수
--ROLLUP 함수와 같이 각 속도 출력하고 전체 총계까지 출력합니다.
SELECT DEPTNO, POSITION, COUNT(*), SUM(PAY)
FROM PROFESSOR
GROUP BY CUBE(DEPTNO,POSITION);

--GROUPING 함수 - 그루핑 작업에 사용 유무를 확인하는 함수
SELECT DEPTNO, SUM(PAY),
GROUPING(dEPTNO) G_dEPTNO
FROM PROFESSOR
GROUP BY ROLLUP(DEPTNO);

SELECT DEPTNO, POSITION, SUM(PAY),
GROUPING(DEPTNO) G_DEPTNO,
GROUPING(POSITION) G_POSITION
FROM PROFESSOR
GROUP BY ROLLUP(DEPTNO,POSITION);
