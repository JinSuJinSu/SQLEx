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
from employees
where salary< any(select avg(salary)
                from employees
                group by department_id)
group by salary;


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














