select * from employees;
select * from jobs;
select * from departments;
select * from countries;
select * from locations;
select * from regions;
select * from job_history;

--1
select count(employee_id)
from employees
where salary<(select avg(salary)
            from employees);

--2
select employee_id, first_name, salary
from employees
where salary>=(select avg(salary)
                from employees)
order by salary;

--3
select loc.location_id, loc.street_address, loc.postal_code,
loc.city, loc.state_province, loc.country_id
from locations loc, departments dep, employees emp
where emp.department_id = dep.department_id
and loc.location_id = dep.location_id
and emp.first_name = 'Steven' and emp.last_name = 'King';



--4
select employee_id, first_name, salary
from employees
where salary<any((select salary
                from employees
                where job_id = 'ST_MAN'))
order by salary desc;


--5-1
select employee_id, first_name, salary, department_id
from employees
where (salary, department_id) in (select max(salary), department_id
from employees
where department_id is not null
group by department_id)
order by salary desc;

--5-2
select distinct emp1.employee_id, emp1.first_name, emp1.salary, emp1.department_id
from employees emp1
inner join employees emp2
on (emp1.salary, emp1.department_id) in
(select max(emp2.salary), emp2.department_id
from employees emp2
where emp2.department_id is not null
group by emp2.department_id)
order by emp1.salary desc;


--6
select j.job_title,
sum(emp.salary*12+nvl(emp.commission_pct,0)*12*emp.salary) as "연봉"
from employees emp, jobs j
where j.job_id = emp.job_id
group by j.job_title
order by  sum(emp.salary*12+nvl(emp.commission_pct,0)*12*emp.salary) desc;


--7
select employee_id, first_name, salary
from employees emp
where salary> any(select avg(salary)
                from employees
                where department_id=emp.department_id);


--8
select vt.ranking, emp.employee_id, emp.first_name,
emp.salary,emp.hire_date from employees emp,
(select rank() OVER (ORDER BY hire_date) ranking, hire_date
from employees) vt
where vt.ranking between 11 and 15
and emp.hire_date = vt.hire_date
group by emp.employee_id, emp.first_name,
emp.salary,emp.hire_date,vt.ranking
order by vt.ranking;























