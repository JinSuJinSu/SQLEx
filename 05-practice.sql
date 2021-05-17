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
select manager_id, first_name, round(avg(salary)) as "avg_salary",
min(salary) as "min_salary", max(salary) as "max_salary"
from employees
where hire_date >= '05/01/01' and manager_id=employee_id
group by manager_id
having round(avg(salary))>=5000
order by round(avg(salary)) desc;


--4
select emp.employee_id, emp.first_name, dep.department_name,
man.first_name
from employees emp
inner join employees man
on emp.manager_id = man.employee_id
left outer join departments dep
on dep.department_id = emp.department_id;

--5(보류)
select employee_id, first_name || ' ' || last_name as "Name",
salary, hire_date
from (
select emp.*, rownum as rnum from employees emp
order by hire_date)
where rnum between 11 and 15;

--6
select emp.first_name||' '||emp.last_name "Name", emp.salary,
dep.department_name
from employees emp, departments dep
where emp.department_id = dep.department_id
and hire_date = (select max(hire_date) from employees);

--7(보류)
select emp.employee_id, emp.first_name, emp.last_name, j.job_title,emp.salary
from employees emp, jobs j
where emp.job_id = j.job_id
and (salary,department_id) in (select* from(select avg(salary), department_id
                from employees
                group by department_id
                order by  avg(salary) desc)
                where rownum=1);
                
--8
select dep.department_name
from departments dep
inner join employees emp
on dep.department_id = emp.department_id
where salary = (select avg(salary) from employees
                group by salary
                having avg(salary) = ( select * from
                (select avg(salary) from employees
                group by salary
                order by avg(salary) desc)
                where rownum<=1));
           
--9
select re.region_name
from locations loc
inner join departments dep
on loc.location_id = dep.location_id
inner join employees emp
on dep.department_id = emp.department_id
inner join countries co
on loc.country_id = co.country_id
inner join regions re
on re.region_id = co.region_id
where salary = (select avg(salary) from employees
                group by salary
                having avg(salary) = ( select * from
                (select avg(salary) from employees
                group by salary
                order by avg(salary) desc)
                where rownum<=1));

   
                
                

