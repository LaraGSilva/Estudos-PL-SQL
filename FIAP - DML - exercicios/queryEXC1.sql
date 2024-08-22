/*
Selecionar o last_name, salary (Salary) e o nome de departamento (department_name) e
o endere�o do departamento (street_address) de todos os funcion�rio que trabalham
ou no departamento 60 ou no 90.
*/

select e.last_name, e.salary, d.department_name, l.street_address 
from departments d 
inner join employees e on d.department_id = e.department_id
inner join locations l on l.location_id = d.location_id
where d.department_id = 60 or d.department_id = 90 ;


/*
Selecione o last_name e o salary dos empregados que tem o sal�rio maior que o sal�rio
de qualquer um dos empregados que tem o cargo de programador (JOB_ID) (IT_PROG), 
comando MAX � menos perfomatico
*/

select e.last_name, e.salary 
from employees e
where salary > (select ALL(salary) from employees e 
                        where e.job_id = 'IT_PROG');
                        
/*1.Crie um relatório que exiba o número e o sobrenome de todos os 
funcionários cujo salário é maior que o salário médio. 
Classifique os resultados em ordem crescente de salário.*/        

select e.phone_number, e.last_name, /*e.salary*/
from employees e 
where e.salary > (select AVG(salary) from employees)
order by e.salary asc;

select ROUND(AVG(salary), 2)from employees;
                        
/*
2.Crie uma consulta que exiba o número e o sobrenome de todos os funcionários que trabalham em um
departamento com funcionários cujos sobrenomes contêm a letra u. 
Inclua a instrução SQL no arquivo de texto lab_08_02.sql. Execute a consulta
*/ 

select e.phone_number, e.last_name
from employees e 
inner join
departments d 
on e.department_id = d.department_id 
where UPPER(e.last_name) like UPPER('%U%');

/*
3.O departamento de recursos humanos precisa de um relatório que exiba o sobrenome,
o número do departamento e o ID do cargo de todos os funcionários cujo ID de local do departamento é 1700
*/

select e.last_name,e.job_id ,d.department_id
from employees e
left join departments d on d.department_id = e.department_id
where d.location_id = '1700';

/*4.
Crie um relatório para o departamento de recursos humanos que exiba o sobrenome 
e o salário de todos os funcionários subordinados a Steven King*/

select e.last_name, e.salary
from employees e
inner join employees manager
on e.manager_id = manager.employee_id
where manager.last_name = 'King';

/*
5.
Crie um relatório para o departamento de recursos humanos que exiba o número 
do departamento, o sobrenome e o ID do cargo de todos os funcionários no 
departamento executivo
*/

select d.department_id, e.last_name, e.job_id
from departments d
inner join
employees e
on d.department_id = e.department_id
where LOWER(d.department_name) = 'executive';

/*
6.
Modifique a consulta em lab_08_02.sql para exibir o número, o sobrenome,
bem como o salário de todos os funcionários que ganham mais que o salário médio
e trabalham em um departamento com funcionários cujos sobrenomes
contêm a letra u. Salve novamente lab_06_03.sql como lab_08_06.sql.
Execute a instrução em lab_08_06.sql
*/

select e.employee_id, e.last_name, e.salary
from employees e
where e.salary > (select ROUND(AVG(e.salary),2) from employees e
                    where UPPER(e.last_name) LIKE  UPPER('%U%'));
