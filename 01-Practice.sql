select * from employees;
select * from jobs;
select * from departments;
select * from countries;
select * from locations;

--1
select first_name||' '||last_name as "이름", salary as "월급",
phone_number as "전화번호", hire_date as "입사일"
from employees
order by hire_date;

--2
select job_title, max_salary
from jobs
order by max_salary desc;


--3
select first_name||' '||last_name as "Name", manager_id, commission_pct, salary
from employees
where salary>3000 and commission_pct is null and manager_id is not null;

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

--11(심화 문제)
select upper(countries.country_name) from countries
inner join locations
on countries.country_id = locations.country_id
inner join departments
on locations.location_id = departments.location_id
order by countries.country_name;












