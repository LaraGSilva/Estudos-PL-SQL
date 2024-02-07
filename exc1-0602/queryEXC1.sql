/*Selecionar o last_name, salary (Salary) e o nome de departamento (department_name) e
o endereço do departamento (street_address) de todos os funcionário que trabalham
ou no departamento 60 ou no 90.*/

select e.last_name, e.salary, d.department_name, l.street_address 
from departments d 
inner join employees e on d.department_id = e.department_id
inner join locations l on l.location_id = d.location_id
where d.department_id = 60 or d.department_id = 90 ;


/*Selecione o last_name e o salary dos empregados que tem o salário maior que o salário
de qualquer um dos empregados que tem o cargo de programador (JOB_ID) (IT_PROG), comando MAX é menos perfomatico*/

select e.last_name, e.salary 
from employees e
where salary > (select ALL(salary) from employees e 
                        where e.job_id = 'IT_PROG');