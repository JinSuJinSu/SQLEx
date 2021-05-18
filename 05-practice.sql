select * from employees;
select * from jobs;
select * from departments;
select * from countries;
select * from locations;
select * from regions;
select * from job_history;


--1
select first_name || ' ' || last_name as "Name",
manager_id, commission_pct, salary
from employees
where commission_pct is null and salary>3000
and manager_id is not null;

--2
select employee_id, first_name, salary,
TO_CHAR(hire_date,'DL') as "Date",
replace(phone_number,'.','-') as "Phone" ,department_id
from employees
where (salary, department_id) in (select max(salary), department_id
from employees
where department_id is not null
group by department_id)
order by salary desc;

--3(나중에)
select employee_id, first_name, round(avg(salary)) as "avg_salary",
min(salary) as "min_salary", max(salary) as "max_salary"
from employees emp
where salary>any(select avg(salary)
                    from employees
                    where emp.manager_id = manager_id
                    )
order by round(avg(salary)) desc;

--4
select emp.employee_id, emp.first_name, dep.department_name,
man.first_name
from employees emp
inner join employees man
on emp.manager_id = man.employee_id
left outer join departments dep
on dep.department_id = emp.department_id;

--5
select vt.ranking, emp.employee_id, emp.first_name,
dep.department_name, emp.salary,emp.hire_date
from employees emp, departments dep,
(select rank() OVER (ORDER BY hire_date) ranking, hire_date
from employees) vt
where vt.ranking between 11 and 20
and emp.hire_date = vt.hire_date
and dep.department_id = emp.department_id
group by emp.employee_id, emp.first_name,
emp.salary,emp.hire_date,dep.department_name,vt.ranking
order by vt.ranking;

--6
select emp.first_name||' '||emp.last_name "Name", emp.salary,
dep.department_name
from employees emp, departments dep
where emp.department_id = dep.department_id
and hire_date = (select max(hire_date) from employees);

--7
select emp.employee_id, emp.first_name, emp.last_name,
j.job_title, emp.salary
from employees emp, jobs j
where emp.job_id = j.job_id and
department_id = (select * from(select department_id
from employees
group by department_id
order by avg(salary) desc)
where rownum<=1)
order by salary;
                


                
--8
select distinct dep.department_name
from departments dep, employees emp
where dep.department_id = emp.department_id
and dep.department_id = (select * from(select department_id
from employees
group by department_id
order by avg(salary) desc)
where rownum<=1);


           
--9
select distinct re.region_name
from locations loc
inner join departments dep
on loc.location_id = dep.location_id
inner join employees emp
on dep.department_id = emp.department_id
inner join countries co
on loc.country_id = co.country_id
inner join regions re
on re.region_id = co.region_id
where dep.department_id = (select * from(select department_id
from employees
group by department_id
order by avg(salary) desc)
where rownum<=1);


--10
select distinct j.job_title
from jobs j
inner join employees emp
on j.job_id = emp.job_id
inner join departments dep
on dep.department_id = emp.department_id
where dep.department_id = (select * from(select department_id
from employees
group by department_id
order by avg(salary) desc)
where rownum<=1);

   
                
                

