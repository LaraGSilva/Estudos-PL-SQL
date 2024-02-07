drop table EMPLOYEES_RETIRED;
 CREATE TABLE EMPLOYEES_RETIRED 
   (	EMPLOYEE_ID NUMBER(6), 
	FIRST_NAME VARCHAR2(20), 
	LAST_NAME VARCHAR2(25), 
	EMAIL VARCHAR2(25), 
	PHONE_NUMBER VARCHAR2(20), 
	HIRE_DATE DATE, 
	RETIRED_DATE DATE, 
	JOB_ID VARCHAR2(10), 
	SALARY NUMBER(8,2), 
	COMMISSION_PCT NUMBER(2,2)
  ) ;
 
insert into employees 
VALUES (207,'Petter','Lion','plion@pp.com',null,sysdate,'IT_PROG',5000,NULL,NULL,210);
insert into employees 
VALUES (208,'Bob','Conor','bconnor@cda.com',null,sysdate,'IT_PROG',5700,NULL,NULL,210);
 
  
 drop table SAL_HIST_DEPT;
 CREATE TABLE SAL_HIST_DEPT 
   (	EMP_ID NUMBER(6), 
	HIREDATE DATE NOT NULL,
	SALARY NUMBER(8,2)
   ) ;

drop table MGR_HIST_DEPT ;
  CREATE TABLE MGR_HIST_DEPT 
   (	EMPID NUMBER(6), 
	MANAGER NUMBER(6), 
	SAL NUMBER(8,2)
   );
   
   
drop table highest_sal;
create table highest_sal
	(deptid number(4),
	sal number(8,2));

drop table hiredate_hist_00;
create table hiredate_hist_00
	(deptid number(4),
	hiredate date);

drop table hiredate_hist_99;
create table hiredate_hist_99
	(deptid number(4),
	hiredate date);

drop table hiredate_hist;
create table hiredate_hist
	(deptid number(4),
	hiredate date); 
	
	
drop table sales_informations;
create  table sales_informations
	(emp_id number(5),
	last_name varchar(50) not null,
	week_id number(2),
	week_day varchar(10));

drop TABLE SALES_DATA;
CREATE TABLE SALES_DATA
	(employee_id 	NUMBER(6),
	last_name  VARCHAR(50),
	WEEK_ID	NUMBER(2),
	MONDAY	NUMBER(8,2),
	TUESDAY	NUMBER(8,2),
	WEDNESDAY	NUMBER(8,2),
	THURSDAY	NUMBER(8,2),
	FRIDAY	NUMBER(8,2));
	
INSERT INTO SALES_DATA 
VALUES (176,'Meg', 6, 2000,3000,4000,5000,6000);
commit;
	
	
drop table catalog1;	
create table catalog1 
	(id number(3), 
	item varchar2 (20), 
	price number(6));

insert into catalog1 values(1, 'laptop', 800);
insert into catalog1 values(2, 'iphone', 500);
insert into catalog1 values(3, 'camera', 700);
commit;

drop table catalog2;	 
create table catalog2 
(id number(3), 
item varchar2 (20), 
price number(6));

insert into catalog2 values(1, 'laptop', 899);
insert into catalog2 values(2, 'iphone', 599);
insert into catalog2 values(5, 'video camera', 799);
commit;