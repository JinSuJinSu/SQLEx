select * from employees;
select * from jobs;
select * from departments;
select * from countries;
select * from locations;
select * from regions;

--1
select emp.employee_id, emp.first_name, emp.last_name, dep.department_name
from employees emp
inner join departments dep
on emp.department_id = dep.department_id
order by dep.department_name, emp.employee_id desc;

--2
select emp.employee_id, emp.first_name, emp.salary,
dep.department_name, j.job_title
from employees emp
inner join departments dep
on emp.department_id = dep.department_id
inner join jobs j
on emp.job_id = j.job_id
order by emp.employee_id;

--2-1
select emp.employee_id, emp.first_name, emp.salary,
dep.department_name, j.job_title
from employees emp
left outer join departments dep
on emp.department_id = dep.department_id
inner join jobs j
on emp.job_id = j.job_id
order by emp.employee_id;

--3
select loc.country_id, co.country_name, dep.department_name, dep.department_id
from countries co
inner join locations loc
on co.country_id = loc.country_id
inner join departments dep
on loc.location_id = dep.location_id
order by loc.country_id;

--3-1 3번 문제 일단 보류한다
select loc.country_id, co.country_name, dep.department_name, dep.department_id
from countries co
inner join locations loc
on co.country_id = loc.country_id
inner join departments dep
on loc.location_id = dep.location_id
order by loc.country_id;

--4
select reg.region_name, co.country_name
from regions reg
inner join countries co
on reg.region_id = co.region_id
order by region_name, country_name desc;

--5
select emp.employee_id, emp.first_name, emp.hire_date,
man.first_name, man.hire_date
from employees emp, employees man
where emp.manager_id = man.employee_id
and emp.hire_date < man.hire_date;

--6
select co.country_name, co.country_id, loc.city, loc.location_id,
dep.department_name, dep.department_id
from countries co
inner join locations loc
on co.country_id = loc.country_id
inner join departments dep
on loc.location_id = dep.location_id
order by co.country_name;







