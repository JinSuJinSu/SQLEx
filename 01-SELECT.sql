select * from employees;
select first_name||' '||last_name "Name" from employees
where manager_id=100 or manager_id=120 or manager_id=147 ;

select first_name||' '||last_name "Name" from employees
where manager_id in(100, 120, 147);