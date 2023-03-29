use db_dbclass;
-- 학생 테이블 생성
create table Student(
id bigint,
student_name varchar(5),
student_moblie varchar(20),
student_major varchar(30)
);
-- 학생테이블 데이터 전체조회
select * from Student;
-- 본인 옆에 있는 사람들의 정보를 정보테이블에 저장해보기
insert into student(id, student_name, student_moblie, student_major)
values(1, '이예진', '010-1111-1111', '무역학');
insert into student(id, student_name, student_moblie, student_major)
values(2, '송길수', '010-2222-2222', '컴퓨터공학');
insert into student(id, student_name, student_moblie, student_major)
values(3, '송길수', '010-3333-3333', '관광경영학과');

-- 테이블 삭제하는 방법 
drop table Student;

-- 데이터 베이스 연습용 샘플

create table dept (
    deptno int, -- 부서 번호
    dname varchar(14), -- 부서 이름
    loc varchar(13) -- 부서 위치
);

create table emp (
    empno int, -- 사번
    ename varchar(10), -- 직원 번호
    job varchar(9), -- 직급
    mgr int, -- 상사 사번
    hiredate DATE, -- 입사일
    sal int, -- 월급
    comm int, -- 보너스
    deptno int -- 소속 부서 (번호)
);

-- 보너스 
create table bonus (
    ename varchar(10),
    job varchar(9),
    sal int,
    comm int
);

-- 급여수준
create table salgrade (
    grade int,
    losal int,
    hisal int
);
    
insert into dept values	(10,'ACCOUNTING','NEW YORK');
insert into dept values (20,'RESEARCH','DALLAS');
insert into dept values (30,'SALES','CHICAGO');
insert into dept values	(40,'OPERATIONS','BOSTON');    

insert into emp values (7369,'SMITH','CLERK',7902, str_to_date('17-12-1980','%d-%m-%Y'),800,NULL,20);
insert into emp values (7499,'ALLEN','SALESMAN',7698,str_to_date('20-2-1981','%d-%m-%Y'),1600,300,30);
insert into emp values (7521,'WARD','SALESMAN',7698,str_to_date('22-2-1981','%d-%m-%Y'),1250,500,30);
insert into emp values (7566,'JONES','MANAGER',7839,str_to_date('2-4-1981','%d-%m-%Y'),2975,NULL,20);
insert into emp values (7654,'MARTIN','SALESMAN',7698,str_to_date('28-9-1981','%d-%m-%Y'),1250,1400,30);
insert into emp values (7698,'BLAKE','MANAGER',7839,str_to_date('1-5-1981','%d-%m-%Y'),2850,NULL,30);
insert into emp values (7782,'CLARK','MANAGER',7839,str_to_date('9-6-1981','%d-%m-%Y'),2450,NULL,10);
insert into emp values (7788,'SCOTT','ANALYST',7566,str_to_date('13-7-87','%d-%m-%Y'),3000,NULL,20);
insert into emp values (7839,'KING','PRESIDENT',NULL,str_to_date('17-11-1981','%d-%m-%Y'),5000,NULL,10);
insert into emp values (7844,'TURNER','SALESMAN',7698,str_to_date('8-9-1981','%d-%m-%Y'),1500,0,30);
insert into emp values (7876,'ADAMS','CLERK',7788,str_to_date('13-7-87','%d-%m-%Y'),1100,NULL,20);
insert into emp values (7900,'JAMES','CLERK',7698,str_to_date('3-12-1981','%d-%m-%Y'),950,NULL,30);
insert into emp values (7902,'FORD','ANALYST',7566,str_to_date('3-12-1981','%d-%m-%Y'),3000,NULL,20);
insert into emp values (7934,'MILLER','CLERK',7782,str_to_date('23-1-1982','%d-%m-%Y'),1300,NULL,10);
		 
insert into salgrade values (1,700,1200);
insert into salgrade values (2,1201,1400);
insert into salgrade values (3,1401,2000);
insert into salgrade values (4,2001,3000);
insert into salgrade values (5,3001,9999);

select * from emp; 
select * from bonus; -- 조회결과 없음
select * from salgrade;
select * from dept;

-- 이하부터 

-- emp 테이블 전체 조회
select * from emp;
-- emp 테이블의 empno, ename컬럼만 조회 
select empno, ename from emp;
-- emp 테이블의 job 컬럼만 조회
select job from emp;

-- 중복값 제외 리스트에서 (직급 중복을 삭제하고 싶다)
select distinct job from emp;

-- 사원 이름 조회 (오름차순) :asc 오름차순의 약자
select ename from emp order by ename asc;
select * from emp order by ename asc;

-- 사원 이름 조회 (내림차순) :desc 오름차순의 약자
select ename from emp order by ename desc;
select * from emp order by ename desc;

-- 급여 (sal)을 기준으로 오름차순, 내림차순 정렬
select * from emp order by sal asc;
select * from emp order by sal desc;

-- 입사일(hiredate) 기준으로 오름차순, 내림차순 정렬
select * from emp order by hiredate asc;
select * from emp order by hiredate desc;

-- 급여를 기준으로 둔후 이름순으로 정렬
select * from emp order by sal, ename asc; -- asc는 생략이 가능하기에 이 문장을 쓸수있음
select * from emp order by sal asc, ename asc;

-- where 절 : 조건을 적용할 때
-- 직급이 salesman인 사원만 조회
select * from emp where job = 'salesman';

-- 직급이 manager인 사원만 조회
select * from emp where job = 'manager';

-- 부서번호 (deptno)가 10인 사원만 조회
select * from emp where deptno = 10;

-- 이름이 james인 사원의 정보 조회
select * from emp where ename = 'james';

-- 사번이 7654인 사원의 정보 조회
select * from emp where empno = 7654;

-- 직급이 manager이고 부서번호가 20인 사원조회
select * from emp where job = 'manager' and deptno = 20;
-- 이름 : &(엠퍼센트), *(아스테리스크), '' (싱글쿼터), ""(더블쿼터), `(백틱)

-- 직급이 salesman이거나 부서번호가 10인 사원조회
select * from emp where job = 'salesman' or deptno = 10;

-- 급여가 3000 이상인 사원 조회 
select * from emp where sal >= 3000;

-- 급여가 3000 이상인 사원 조회 결과를 내림차순으로 정렬
select * from emp where sal >= 3000 order by sal desc;
-- where절이 먼저 오고 뒤에 order by절이 온다

-- 직급이 salesman이 아닌 사원 조회 
select * from emp where job != 'salesman';
select * from emp where not job = 'salesman';

-- 급여가 2000이상 3000이하인 사원 조회 
select * from emp where 2000<= sal <=3000; -- x
select * from emp where sal >=2000 and sal <=3000;
select * from emp where sal between 2000 and 3000;

-- 급여가 2000이상 3000 이하인 사원을 빼고 조회
select * from emp where sal not between 2000 and 3000;

-- like 연산자 

select * from emp where ename like 'm%'; 
-- m으로 시작하는 이름 (%은 글자수 예약이 없다)

select * from emp where ename like '%m'; 
-- m으로 끝나는 이름

select * from emp where ename like '%m%';  -- → 출력
-- m의 앞뒤로 몇글자가 오든지 상관은 없는 이름 (m이 들어가는 이름)

select * from emp where ename like '_%m'; 
-- m이라는 글자가 2번째에 있는 이름

select * from emp where ename like '__%m'; 
-- m이라는 글자가 3번째에 있는 이름 

-- 81년 4월 1일 이후 입사한 사원 조회
select * from emp where hiredate > '1981-04-01';
select * from emp where hiredate < '1981-04-01';
select * from emp where hiredate > str_to_date('1981-04-01', '%Y-%m-%d'); -- %Y-%m%d 는 대소문자 구분을 해야함

-- 테이블구조 확인
desc emp;

-- 집계함수 
-- sum(), avg(), max(), min(), count()
-- 사원 급여의 총합 
select sum(sal) from emp;
select sum(sal) as '급여총합' from emp; -- as : 별칭을 지정할때 사용 

-- salesman 급여 총합 
select sum(sal) from emp where job = 'salesman';

-- manager의 급여총합
select sum(sal) from emp where job = 'manager';

-- 전체사원의 평균 급여 조회 
select avg(sal) from emp;

-- 구글링으로 평균급여를 소수 둘째자리 까지 표현
select truncate(avg(sal),2) from emp; 
-- 숫자, 자릿수를 버릴때 사용

select round(avg(sal),2) from emp; 
-- 숫자, 자릿수(생략가능)를 반올림하여 함수의 두번째파라미터 생략 시 소수점 전체를 기준으로 반올림 


select sysdate() from dual; -- 현재 날짜와 시간을 알려줌 sysdate()

-- round() → 반올림
select round(12.345, 2)from dual; -- 12.35
select round(12.345, 1)from dual; -- 12.3
select round(12.345, 0)from dual; -- 12

-- 가장 높은 급여 값 조회 
select max(sal) from emp;

-- 가장 높은 급여의 값을 받는 사람 조회 
select * from emp where sal = (
	select max(sal)
    from emp
);

-- 가장 낮은 급여 값 조회 
select min(sal) from emp;

-- 전체 사원 수 조회 
select count(*) from emp;

-- 부서번호가 20인 사원수 조회
select count(*) from emp where deptno = 20;

-- 그룹화(동일한 데이터끼리 묶는 것, grouping)
-- 주의할점 : 조회결과는 그룹핑한 컬럼이름 또는 집계함수 등을 사용함 ( *이 오면 안된다)
-- 직급으로 그룹핑 
select job from emp group by job;
select * from emp group by job; -- X

-- 직급별 평균 급여 
select job, avg(sal) from emp group by job;
-- 부서별 평균 급여
select deptno, avg(sal) from emp group by deptno;

-- 직급별 사원수 조회
select job, count(*) from emp group by job;
-- 직급별 평균 급여, 사원수 조회
select job, count(*), avg(sal) from emp group by job;
-- 위의 결과에서 직급값을 오름차순으로 정렬 
select job, count(*) ,avg(sal) from emp group by job order by job asc;
-- 위의 결과에서 평균 급여를 소수점 첫재짜리 까지 조회 
select job, count(*) ,round(avg(sal),2) from emp group by job order by job asc;
-- 위의 결과에서 job은 직급으로, 급여 평균값은 평균급여로, 사원수 조회값은 사원수로 표현
select job as '직급', count(*) as'사원수', round(avg(sal),2) as '평균급여' from emp group by job order by job asc;


-- 부서별 그룹핑 

select deptno from emp group by deptno;
select deptno, avg(sal) from emp group by deptno;

-- 부서별 그룹핑하고 그 안에서 직급별 그룹핑 

select deptno, job, avg(sal) from emp group by deptno, job;
select deptno, job, avg(sal) from emp group by  job, deptno;
select deptno, job, avg(sal) from emp group by deptno, job order by job asc;
select deptno, job, avg(sal) from emp group by deptno, job order by deptno asc;

-- having : 그룹핑한 결과에서 조건 적용
-- 부서, 직급별로 묶고 그 결과에서 평균급여가 2000이상인 결과만 조회 
select deptno, job, avg(sal) from emp 
                       group by deptno, job 
                       having avg(sal) >= 2000
                          order by deptno asc;
                          

select * from emp order by sal asc; -- 전체 출력

-- 급여가 3000 이하인 사원을 대상으로 위의 그룹핑 수행
select deptno, job, avg(sal) from emp 
                     where sal <= 3000
                        group by deptno, job 
                           having avg(sal) >= 2000
                              order by deptno asc;
                              
-- date 타입을 문자로 표현하기 : date_format()
select date_format(hiredate, '%Y') from emp; -- 년도 값만 출력

/*
	연습문제
	1. 부서별 평균급여, 최고급여, 최저급여, 사원수 조회(평균급여는 소수점 둘째자리에서 반올림)
    2. 직급별 사원수 조회(단 3명 이상인 결과만 출력)
    3. 연도별 입사한 사원수 조회(조회결과 : 연도(yyyy), 사원수)
    3.1. 위의 결과에서 각 연도별로 부서별 입사한 사원수 조회(조회결과 : 연도(yyyy), 부서번호, 사원수)
*/

select deptno as '부서번호', round(avg(sal),1) as '평균급여', max(sal) as '최고급여', min(sal) as '최저급여', count(*) as '사원수' from emp group by deptno;
select job , count(empno) from emp group by job having count(*) >= 3;
select date_format(hiredate, '%Y') as '입사년도', count(*) as '사원수' from emp group by date_format(hiredate, '%Y'); 
select date_format(hiredate, '%Y') as '입사연도', deptno as '부서번호', count(*) as '사원수' from emp 
							group by deptno, date_format(hiredate, '%Y');
                            
select * from emp;
select * from dept;

-- 외부조인 
select * from emp, dept;
-- 조인 (공통된 컬럼을 기준으로 조인)
-- 공통속성을 파악해야함
select * from emp, dept where emp.deptno = dept.deptno;
select * from emp e, dept d where e.deptno = d.deptno; -- 약어 사용 가능
select empno, ename, dname, loc from emp e, dept d where e.deptno = d.deptno; -- 특정 정보 검색

-- deptno select하면 애러가 남 
-- deptno가 애매 하기 때문에 (why? empt에도 있고 dmpt에도 있기 때문에 : 어느 테이블에것을 보여줘야 할지가 불분명)
select empno, ename, deptno, dname, loc from emp e, dept d where e.deptno = d.deptno; -- X
-- 각각의 컬럼 이름에 컬럼이 어디에 있는지 적어주는 것이 좋다 (소속을 밝혀준다)
select e.empno, e.ename, e.deptno, d.dname, d.loc from emp e, dept d where e.deptno = d.deptno;

-- 조인 후 emp 테이블만 조회
select e.* from emp e, dept d where e.deptno = d.deptno;

-- emp, dmpt를 조인하여 empno, ename, deptno, dname, loc 조회
-- (단, 급여가 2500이상인 사원만 조회하고, 조회결과는 사원이름을 기준으로 오름차순 정렬)

select e.empno, e.ename, d.deptno, d.dname, d.loc from emp e, dept d where e.deptno = d.deptno and e.sal >=2500 order by e.ename asc;


--                       --           -------------------------------------
-- 최저급여를 받는 사람이 누구인가?
select * from emp order by sal asc;

-- 1. 최저급여 값이 얼마인지 
-- 2. 최저급여 값을 받는(최저 급여 값과 sal 값이 일치하는)사람이 누구인지
select min(sal) from emp;
select * from emp where sal = 800;
 -- 서브 쿼리 적용
select * from emp where sal =( select min(sal) from emp);

-- 최고급여를 받는 사원 정보 조회
select * from emp where sal =( select max(sal) from emp);

-- allen 보다 높은 급여를 받는 사원 조회
select * from emp order by sal asc;
select sal from emp where ename = 'allen';
select * from emp where sal > 1600;
-- 1600 allen의 급여값
select * from emp  where sal > ( select sal from emp where ename = 'allen');

-- 예제 
/*
	연습문제 
    1. clark 보다 늦게 입사한 사원 조회 
    2. 부서번호가 20인 사원 중에서 전체 사원 평균 급여보다 높은 급여를 받는 사원 조회 
    3. 2번 조회 결과에서 부서이름, 부서위치도 함께 조회 
*/
select * from emp; -- 1981-06-09
select hiredate from emp where ename = 'clark';
select hiredate from emp where hiredate > '1981-06-09';
select * from emp where hiredate > (select hiredate from emp where ename = 'clark');

select avg(sal) from emp;
select * from emp where sal > 2073;
select * from emp where sal > 2073 and deptno = 20;
-- 선생님 풀이
select * from emp where sal >(select avg(sal) from emp) and deptno = 20;
-- 내풀이
select * from emp where deptno = 20 and sal >(select avg(sal) from emp);

-- 선생님 풀이 ( 서브쿼리가 먼저 나와 약어가 먹히지 않음)
select * from emp e, dept d where e.deptno= d.deptno and e.sal >(select avg(sal) from emp) and e.deptno = 20;
-- 내풀이
select * from emp e, dept d where e.deptno=d.deptno and d.deptno = 20 and e.sal > (select avg(e.sal) from emp e);

create table member1(
id bigint, -- 아이디라는 형식은 일련번호로 사용함
member_email varchar(20),
member_password varchar(10)
);

insert into member1(id, member_email, member_password) values(1, 'member1@email.com', '1111'); -- 제일 기본적인 방법, 문제가 발생할 확률이 적음
-- 모든 컬럼에 데이터를 저장한다면 컬럼 이름 생략 가능 
insert into member1 values(2, 'member1@email.com', '2222');
insert into member1 values(3, 'member1@email.com'); -- x error 1136

insert into member1(id, member_email) values(4, 'member1@email.com'); 
-- 특정컬럼에만 넣고싶을때 값을 넣을 컬럼이름을 지정하면 사용가능

insert into member1 values(2, 'member1@email.com', '22222222222'); -- error 1406
insert into member1(id, member_email, member_password) values (5, null, '1111');
insert into member1(id, member_email, member_password) values (null, null, '1111');
select * from member1;

create table member2(
id bigint not null, -- not null ▶ 반드시 값을 넣어라 (null이 될 수 없음)
member_email varchar(20),
member_password varchar(10)
);

desc member2; -- desc 테이블의 구조를 볼 수 있는 명령어
insert into member2(id, member_email, member_password) values(1, 'member1@email.com', '1111');
insert into member2(id, member_email, member_password) values(null, 'member1@email.com', '1111');  -- error 1048 (컬럼 id는 null일수 없다)
insert into member2(id, member_email, member_password) values(2, null, '1111');  -- 제약 조건은 id에만 넣었기 때문에 다른곳은 상관 없음
select * from member2;

create table member3(
id bigint not null unique, 
member_email varchar(20) not null,
member_password varchar(10) not null
);

desc member3;
insert into member3(id, member_email, member_password) values(1, 'member1@email.com', '1111');
insert into member3(id, member_email, member_password) values(1, 'member1@email.com', '1111'); 
-- error 1062 (Duplicate: 중복된) id에는 유니크를 지정해 두었기 때문에 같은 값이 들어올 수 없음
insert into member3(id, member_email, member_password) values(2, 'member1@email.com', '1111'); 

create table member4(
id bigint not null unique, 
member_email varchar(20) not null unique,
member_password varchar(10) not null
);

insert into member4(id, member_email, member_password) values(1, 'member1@email.com', '1111');
insert into member4(id, member_email, member_password) values(2, 'member1@email.com', '2222');
-- error 1062

create table member5(
id bigint not null unique, 
member_email varchar(20) not null unique,
member_password varchar(10) not null,
member_created_date datetime
);

insert into member5(id, member_email, member_password, member_created_date) 
				values(1, 'member1@email.com', '1111', sysdate());
select * from member5;

insert into member5(id, member_email, member_password) 
				values(2, 'member2@email.com', '2222');
                
                
create table member6(
id bigint not null unique, 
member_email varchar(20) not null unique,
member_password varchar(10) not null,
member_created_date datetime default now()
);

insert into member6(id, member_email, member_password) 
				values(2, 'member1@email.com', '1111');
select * from member6;

create table member7(
id bigint primary key, 
member_email varchar(20) not null unique,
member_password varchar(10) not null,
member_created_date datetime default now()
);

insert into member7(id, member_email, member_password) 
				values(2, 'member1@email.com', '1111');
insert into member7(id, member_email, member_password) 
				values(2, 'member2@email.com', '2222');
-- error 1062 primary key가 왔을때도 같은 값을 적으면 XX
select * from member7;

create table member8(
id bigint, 
member_email varchar(20) not null unique,
member_password varchar(10) not null,
member_created_date datetime default now(),
constraint pk_member8 primary key(id) -- 지정하겠다 primary key를 member8의 id에
);
select * from member8;

select * from information_schema.table_constraints;