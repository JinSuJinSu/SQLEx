select * from employees;
select * from jobs;
select * from departments;
select * from countries;
select * from locations;
select * from regions;
select * from job_history;

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
left outer join departments dep
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

--7
select emp.employee_id, emp.first_name || ' ' || emp.last_name as "full_name",
jh.job_id, jh.start_date, jh.end_date
from employees emp
inner join job_history jh
on emp.employee_id = jh.employee_id
where jh.job_id = 'AC_ACCOUNT';

--8(나중에)
select dep.department_id, dep.department_name, man.first_name,
loc.city, co.country_name, reg.region_name
from departments dep, locations loc, countries co,regions reg,
employees emp, employees man
where dep.location_id = loc.location_id
and loc.country_id = co.country_id
and co.region_id = reg.region_id
and emp.manager_id = man.employee_id
and emp.department_id = dep.department_id
and emp.manager_id = dep.manager_id;

--9
select emp.employee_id,emp.first_name, dep.department_name,
man.first_name
from employees emp
inner join employees man
on emp.manager_id = man.employee_id
left outer join departments dep
on emp.department_id = dep.department_id;













