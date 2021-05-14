select * from employees;
select * from jobs;
select * from departments;
select * from countries;
select * from locations;
select * from job_history;

select distinct department_id
from employees
order by department_id;


--1
select count(first_name)
from employees
where manager_id is not null;

--2
select max(salary) - min(salary) as "최고임금 - 최저임금"
from employees;


--3
select TO_CHAR(max(hire_date), 'YYYY"년"MM"월"DD"일"' ) as "date"
from employees;


--4
select round(avg(salary)) as "avg_salary", max(salary) as "max_salary",
min(salary) as "min_salary", department_id
from employees
group by department_id
order by department_id desc;

--5
select round(avg(salary)) as "avg_salary", max(salary) as "max_salary",
min(salary) as "min_salary", job_id
from employees
group by job_id
order by min(salary) desc, round(avg(salary));

--6
select TO_CHAR(start_date,'YYYY-MM-DD') || ' '
|| TO_CHAR(start_date,'DAY') as "real_date"
from job_history
where end_date - start_date = 
(select max(end_date-start_date) from job_history);

--7
select round(avg(salary)) as "avg_salary", min(salary) as "min_salary",
round(avg(salary))- min(salary) as "result_array", department_id
from employees
group by department_id
having round(avg(salary))- min(salary) <2000
order by round(avg(salary))- min(salary) desc;

--8
select job_title, max_salary - min_salary as "최고임금 - 최저임금"
from jobs
order by max_salary - min_salary desc;

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












