//SET SERVEROUTPUT ON;

//declare
    //v_id  number(5) := 12;

//begin
    
   // dbms_output.put_line(v_id);

    //v_id := 2;
    
    //dbms_output.put_line(v_id);
//end;


insert into segmercado (id, descricao) values (1,'varejo');
insert into segmercado (id, descricao) values (2,'atacado');
insert into segmercado (id, descricao) values (3,'varejo');
insert into segmercado (id, descricao) values (4,'atacado');

//select * from segmercado;

//delete from segmercado;


declare
  v_id          segmercado.id%type        :=  1;
  v_descricao   segmercado.descricao%type := 'varejo';
begin
    insert into segmercado(id,descricao) values (v_id, UPPER(v_descricao));
    commit;
end;

declare
    v_cod           produto_exc.cod%type       := 1;
    v_descricao     produto_exc.descricao%type := 'grande';
    v_categoria     produto_exc.categoria%type := 'alimento';
begin
    insert into produto_exc(cod, descricao, categoria)values(v_cod, v_descricao, v_categoria);
    commit;
end;

select * from produto_exc;