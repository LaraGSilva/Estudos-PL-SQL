begin 
     for i in 1..3 loop
        for j in 1..5 loop
            insert into tb_exemplo(col1)  values ('os valores são '|| i || j);
        end loop;
    end loop;
end;

drop table tb_exemplo;
select * from tb_exemplo;
truncate table tb_exemplo;
        
        create table tb_exemplo(
        col1 varchar2(79));