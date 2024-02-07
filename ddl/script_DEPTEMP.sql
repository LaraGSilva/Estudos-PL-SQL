DROP TABLE dept PURGE;
DROP TABLE emp PURGE;

CREATE TABLE dept(
    deptno NUMBER(2,0),
    dname  VARCHAR2(14),
    loc    VARCHAR2(13),
    CONSTRAINT pk_dept PRIMARY KEY (deptno)
  );
  
  INSERT INTO dept VALUES(10, 'ACCOUNTING', 'NEW YORK');
  INSERT INTO dept VALUES(20, 'RESEARCH', 'DALLAS');
  INSERT INTO dept VALUES(30, 'SALES', 'CHICAGO');
  INSERT INTO dept VALUES(40, 'OPERATIONS', 'BOSTON');
  
  CREATE TABLE emp(
    empno    NUMBER(4,0),
    ename    VARCHAR2(10),
    job      VARCHAR2(9),
    mgr      NUMBER(4,0),
    hiredate DATE,
    sal      NUMBER(7,2),
    comm     NUMBER(7,2),
    deptno   NUMBER(2,0),
    CONSTRAINT pk_emp PRIMARY KEY (empno),
    CONSTRAINT fk_deptno FOREIGN KEY (deptno) REFERENCES dept (deptno)
  );
  
  INSERT INTO EMP VALUES
          (7369, 'SMITH',  'CLERK',     7902,
          TO_DATE('17-DEZ-1980', 'DD-MON-YYYY'),  800, NULL, 20);
  INSERT INTO EMP VALUES
          (7499, 'ALLEN',  'SALESMAN',  7698,
          TO_DATE('20-FEV-1981', 'DD-MON-YYYY'), 1600,  300, 30);
  INSERT INTO EMP VALUES
          (7521, 'WARD',   'SALESMAN',  7698,
          TO_DATE('22-FEV-1981', 'DD-MON-YYYY'), 1250,  500, 30);
  INSERT INTO EMP VALUES
          (7566, 'JONES',  'MANAGER',   7839,
          TO_DATE('2-ABR-1981', 'DD-MON-YYYY'),  2975, NULL, 20);
  INSERT INTO EMP VALUES
          (7654, 'MARTIN', 'SALESMAN',  7698,
          TO_DATE('28-SET-1981', 'DD-MON-YYYY'), 1250, 1400, 30);
  INSERT INTO EMP VALUES
          (7698, 'BLAKE',  'MANAGER',   7839,
          TO_DATE('1-MAI-1981', 'DD-MON-YYYY'),  2850, NULL, 30);
  INSERT INTO EMP VALUES
          (7782, 'CLARK',  'MANAGER',   7839,
          TO_DATE('9-JUN-1981', 'DD-MON-YYYY'),  2450, NULL, 10);
  INSERT INTO EMP VALUES
          (7788, 'SCOTT',  'ANALYST',   7566,
          TO_DATE('09-DEZ-1982', 'DD-MON-YYYY'), 3000, NULL, 20);
  INSERT INTO EMP VALUES
          (7839, 'KING',   'PRESIDENT', NULL,
          TO_DATE('17-NOV-1981', 'DD-MON-YYYY'), 5000, NULL, 10);
  INSERT INTO EMP VALUES
          (7844, 'TURNER', 'SALESMAN',  7698,
          TO_DATE('8-SET-1981', 'DD-MON-YYYY'),  1500,    0, 30);
  INSERT INTO EMP VALUES
          (7876, 'ADAMS',  'CLERK',     7788,
          TO_DATE('12-JAN-1983', 'DD-MON-YYYY'), 1100, NULL, 20);
  INSERT INTO EMP VALUES
          (7900, 'JAMES',  'CLERK',     7698,
          TO_DATE('3-DEZ-1981', 'DD-MON-YYYY'),   950, NULL, 30);
  INSERT INTO EMP VALUES
          (7902, 'FORD',   'ANALYST',   7566,
          TO_DATE('3-DEZ-1981', 'DD-MON-YYYY'),  3000, NULL, 20);
  INSERT INTO EMP VALUES
          (7934, 'MILLER', 'CLERK',     7782,
          TO_DATE('23-JAN-1982', 'DD-MON-YYYY'), 1300, NULL, 10);
          
          
          
SET SERVEROUTPUT ON
  DECLARE
    v_empno    emp.empno%TYPE;
    v_ename    emp.ename%TYPE;
    v_job      emp.job%TYPE;
    v_mgr      emp.mgr%TYPE;
    v_hiredate emp.hiredate%TYPE;
    v_sal      emp.sal%TYPE;
    v_comm     emp.comm%TYPE;
    v_deptno   emp.deptno%TYPE;
  BEGIN
  SELECT empno, ename, job, mgr,
        hiredate, sal, comm, deptno
    INTO v_empno, v_ename, v_job, v_mgr,
        v_hiredate, v_sal, v_comm, v_deptno
    FROM emp
  WHERE empno = 7839;
  DBMS_OUTPUT.PUT_LINE ('Codigo   = ' || v_empno);
  DBMS_OUTPUT.PUT_LINE ('Nome     = ' || v_ename);
  DBMS_OUTPUT.PUT_LINE ('Cargo    = ' || v_job);
  DBMS_OUTPUT.PUT_LINE ('Gerente  = ' || v_mgr);
  DBMS_OUTPUT.PUT_LINE ('Data     = ' || v_hiredate);
  DBMS_OUTPUT.PUT_LINE ('Sala     = ' || v_sal);
  DBMS_OUTPUT.PUT_LINE ('Comissao = ' || v_comm);
  DBMS_OUTPUT.PUT_LINE ('Depart.  = ' || v_deptno);  
  END;
/


SET SERVEROUTPUT ON
  DECLARE
    emprec emp%ROWTYPE;
  BEGIN
  SELECT *
    INTO emprec
    FROM emp
  WHERE empno = 7839;
  DBMS_OUTPUT.PUT_LINE ('Codigo   = ' || emprec.empno);
  DBMS_OUTPUT.PUT_LINE ('Nome     = ' || emprec.ename);
  DBMS_OUTPUT.PUT_LINE ('Cargo    = ' || emprec.job);
  DBMS_OUTPUT.PUT_LINE ('Gerente  = ' || emprec.mgr);
  DBMS_OUTPUT.PUT_LINE ('Data     = ' || emprec.hiredate);
  DBMS_OUTPUT.PUT_LINE ('Sala     = ' || emprec.sal);
  DBMS_OUTPUT.PUT_LINE ('Comissao = ' || emprec.comm);
  DBMS_OUTPUT.PUT_LINE ('Depart.  = ' || emprec.deptno);  
  END;
/


declare
    cursor cursor_emp is
        select deptno, sum(sal)
        from emp
        group by deptno;
    begin 
        open cursror_emp;
end; 

//////////////////////////////////////////////////////////////////
DECLARE
    emprec emp%ROWTYPE;  
      CURSOR cursor_emp IS 
          SELECT deptno, SUM(sal)            
            FROM emp       
          GROUP BY deptno;
  BEGIN
    OPEN cursor_emp;
    LOOP
        FETCH cursor_emp INTO emprec.deptno, emprec.sal;
        EXIT WHEN cursor_emp%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE ('Departamento: ' || emprec.deptno);
        DBMS_OUTPUT.PUT_LINE ('Salario     : ' || emprec.sal);
    END LOOP;
    CLOSE CURSOR;
  END;
  /
  
  
  DECLARE
    emprec emp%ROWTYPE;  
    CURSOR cursor_emp IS 
          SELECT empno, sal            
            FROM emp
             FOR UPDATE;
  BEGIN
    OPEN cursor_emp;
    LOOP
        FETCH cursor_emp INTO emprec.empno, emprec.sal;
        EXIT WHEN cursor_emp%NOTFOUND;
        UPDATE emp SET sal = sal * 1.05 WHERE CURRENT OF cursor_emp;
    END LOOP;
    CLOSE cursor_emp;
  END;
  /
  
  
  declare 
    cursor cursor_emp is
    select deptno, sum(sal)
    from emp 
    group by deptno;
begin
    open cursor_emp;
end;

set serveroutput on
declare
cursor cursor_simples is
select deptno, sum(Sal) sanduba
from emp
group by deptno;
begin
    for emprec in cursor_simples loop
        dbms_output.put_line(emprec.deptno || ' e ' || emprec.sanduba);
        
    end loop;
end;
select * from emp;

begin
    for emprec in (select deptno, sum(sal)soma from emp group by deptno)loop
    dbms_output.put_line(emprec.deptno || ' e ' || emprec.soma);
    end loop;
end;



    