select * from employees;
select * from jobs;
select * from departments;
select * from countries;
select * from locations;

select first_name, department_name
from employees e 
inner JOIN departments d
ON d.department_id = e.department_id;


select department_id, department_name, city, country_name
from departments dept, locations loc, countries co
where dept.location_id = loc.location_id and
    loc.country_id = co.country_id;
    
    
    
select emp.employee_id, emp.first_name, emp.manager_id, man.first_name
from employees emp
LEFT OUTER JOIN employees man
   ON emp.manager_id = man.employee_id;

