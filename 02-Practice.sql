select * from employees;
select * from jobs;
select * from departments;
select * from countries;
select * from locations;
select * from job_history;

--1
select count(first_name)
from employees
where manager_id is not null;

--2
select max_salary - min_salary as "최고임금 - 최저임금"
from jobs;


--3
select TO_CHAR(min(hire_date), 'YYYY"년"MM"월"DD"일"' ) as "date"
from employees;


--4
select job_title, max_salary
from jobs
where max_salary>=10000
order by max_salary desc;

--5
select first_name, salary, nvl(commission_pct,0)
from employees
where salary>=10000 and salary<14000
order by salary desc;

--6
select first_name||' '||last_name as "이름", salary as "월급",
TO_CHAR(hire_date,'YYYY-MM') as "입사일", department_id as "부서번호"
from employees
where department_id in(10,90,100);

--7
select first_name||' '||last_name as "이름", salary as "월급"
from employees
where first_name like 'S%' or first_name like 's%';

--8
select department_name
from departments
order by length(department_name);

--9
select UPPER(country_name)
from countries
order by country_name;

--10
select first_name||' '||last_name as "이름", salary as "월급",
replace(phone_number,'.','-') as "전화번호",
TO_CHAR(hire_date,'YYYY-MM-DD') as "입사일"
from employees
where hire_date<'2003-12-31';












