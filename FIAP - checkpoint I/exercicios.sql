
/*Exercicois testados*/

set serverout on;
-------------------------------------------------------

create table funcionarios(
id_funcionario           number(6) not null,
primeiro_nome            varchar2(20),
ultimo_nome              varchar2(25)not null,
salario                  number(8,2),
percentual_comissao      number (2,2)
);

-------------------------------------------------------

declare
    v_cod_func  number(6) := 100;
    v_utlimo_nome   varchar2(25);
    v_salario    number(8,2);
    v_taxa       number (2,1);
begin
    dbms_output.put_line(v_taxa);
end;

-------------------------------------------------------

declare 
    v_cdo_dept int not null := 1;
    v_nome_depto varchar(50) := 'TI';
begin 
     dbms_output.put_line(v_nome_depto);
end;
     
-------------------------------------------------------

declare
    v_nome varchar(25) := 'Americas';
    v_count constant int :=10;
begin 
    dbms_output.put_line(v_nome);
    v_count := v_count +1;
    dbms_output.put_line(v_count);
end;

-------------------------------------------------------

declare 
    v_nome varchar2(25) default 'Meg';
begin
    v_nome := 'Lara';
    dbms_output.put_line(v_nome);
end;

-------------------------------------------------------

create table cp_employess(
    employee_id  number(6) not null,
    last_name  varchar2(25) not null,
    job_id  varchar2(10) not null,
    salary number(8,2)
);

-------------------------------------------------------

insert into cp_employess (employee_id, last_name, job_id, salary) values
(100, 'silva', '1', 10000);

-------------------------------------------------------

declare 
    v_last_name cp_employess.last_name%type;
    v_salary    cp_employess.salary%type;
begin
    select last_name, salary
    from cp_employess
    where employee_id = 100;
    dbms_output.put_line( v_last_name || v_salary);
end;

-------------------------------------------------------

create table cp_employess_I(
    employee_id  number(6) not null,
    first_name  varchar2(25),
    last_name  varchar2(25) not null,
    email  varchar2(25) not null,
    phone_number  varchar2(25),
    hire_date  date not null,
    job_id  varchar2(10) not null,
    salary number(8,2),
    comission_pct number (2,2)
);

-------------------------------------------------------

begin
    INSERT INTO cp_employess_I (employee_id,last_name, email, hire_date, job_id, salary)
    values
    (878989,'zzzzz', 'RCORES', sysdate, 'IT_PROG', 40000);
    commit;
end;
    
-------------------------------------------------------

declare 
    sal_increase number (8,2) :=1500;
begin
    update  cp_employess_I
    set     salary = salary + sal_increase
    where   job_id = 'IT_PROG';
end;

-------------------------------------------------------
    
select * from cp_employess_I;
declare 
    valor integer;
begin 
    if valor < 11 then 
        dbms_output.put_line('verdade');
    else 
         dbms_output.put_line('falsidade');
    end if;
end;

-------------------------------------------------------

declare  
    sysdate  date;
    employee_id number(6);
begin
    select 
        employee_id,
        sysdate
    into
        employee_id,
        sysdate
    from
        cp_employess_I
    where
       last_name = 'zzzzz';
       dbms_output.put_line(EMPLOYEE_ID);
end;

-------------------------------------------------------

declare
    v_data_liite date := sysdate -30;
begin
    dbms_output.put_line(v_data_liite);
end;