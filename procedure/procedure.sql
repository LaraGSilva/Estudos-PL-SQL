create  procedure  incluir_segmercado
(p_id IN number, p_descricao in varchar2)
is
begin
insert into segmercado(id,descricao) values (p_id, UPPER(p_descricao));
commit;
end;

select * from segmercado;

execute incluir_segmercado(2,'farmaceutico');
execute incluir_segmercado(3,'atacadista');

begin
incluir_segmercado (4,'esportista');
end;


//alterando uma procedure ja existente
create or replace procedure  incluir_segmercado
(p_id segmercado.id%type, p_descricao segmercado.descricao%type)
is
begin
insert into segmercado(id,descricao) values (p_id, UPPER(p_descricao));
commit;
end;


create or replace procedure incluir_produto
(p_cod produto_exc.cod%type, p_descricao produto_exc.descricao%type, p_categoria produto_exc.categoria%type)
is
begin
insert into produto_exc(cod, descricao, categoria)values(p_cod, UPPER(p_descricao), UPPER(p_categoria));
commit;
end;

create or replace procedure alterar_produto
(p_cod produto_exc.cod%type, p_categoria produto_exc.categoria%type)
is
begin
update produto_exc set categoria = p_categoria  where cod = p_cod;
commit;
end;

// excluir produto
create or replace procedure excluir_produto
(p_cod produto_exc.cod%type)
is
begin
    delete from produto_exc where cod = p_cod;
    commit;
end;

EXECUTE INCLUINDO_PRODUTO('33854','Frescor da Montanha - Aroma Laranja - 1 Litro','Mate');
EXECUTE INCLUINDO_PRODUTO('89254','Frescor da Montanha - Aroma Uva - 1 Litro','Águas');
EXECUTE ALTERANDO_CATEGORIA_PRODUTO('33854','Águas');
EXECUTE EXCLUINDO_PRODUTO('89254');


create or replace procedure incluir_cliente
(p_id in cliente_mercado.id%type, 
p_seg_mercado_id in cliente_mercado.seg_mercado_id%type,
p_razao_social in cliente_mercado.razao_social%type,
p_cnpj in cliente_mercado.cnpj%type, 
p_faturamento_previsto in cliente_mercado.faturamnto_previsto%type,
p_categoria in cliente_mercado.categoria%type)
is
begin
    insert into cliente_mercado
    (id,seg_mercado_id, razao_social,cnpj,data_inclusao,faturamnto_previsto,categoria) 
    values (p_id, p_seg_mercado_id,p_razao_social,p_cnpj,SYSDATE,p_faturamento_previsto,p_categoria);
    commit; 
end;

execute incluir_cliente(1,1,'produto de plastico',15500,124234567,'varejo');
execute incluir_cliente(2,1,'garrafa de agua',4534500,13443567,'varejo');
execute incluir_cliente(3,1,'pote de plastico',543500,434567,'varejo');
execute incluir_cliente(4,1,'bola de plastcio',22300,34567,'varejo');


select * from cliente_mercado;
select * from segmercado;



CREATE OR REPLACE PROCEDURE INCLUINDO_DADOS_VENDA 
(
p_ID produto_venda_exc.id%type,
p_COD_PRODUTO produto_venda_exc.cod_produto%type,
p_DATA produto_venda_exc.data%type,
p_QUANTIDADE produto_venda_exc.quantidade%type,
p_PRECO produto_venda_exc.preco%type,
p_VALOR produto_venda_exc.valor_total%type,
p_PERCENTUAL produto_venda_exc.percentual_imposto%type
)
IS
BEGIN
   INSERT INTO PRODUTO_VENDA_EXC
   (id, cod_produto, data, quantidade, preco, valor_total, percentual_imposto) 
   VALUES 
   (p_ID, p_COD_PRODUTO, p_DATA, p_QUANTIDADE, p_PRECO, p_VALOR, p_PERCENTUAL);
    COMMIT;
END;
select * from produto_exc;
select * from produto_venda_exc;
EXECUTE INCLUINDO_DADOS_VENDA(2,2, TO_DATE('31/12/1982','DD/MM/YYYY'),56, 12, 400, 80);
EXECUTE INCLUINDO_DADOS_VENDA(1,1, TO_DATE('01/01/2022','DD/MM/YYYY'),100, 10, 1000, 10);
EXECUTE INCLUINDO_DADOS_VENDA(3,3, TO_DATE('02/02/2024','DD/MM/YYYY'),82, 32, 200, 50);


CREATE OR REPLACE PROCEDURE INCLUINDO_DADOS_VENDA 
(
p_ID produto_venda_exercicio.cod%type,
p_COD_PRODUTO produto_venda_exercicio.cod_produto%type,
p_DATA produto_venda_exercicio.data%type,
p_QUANTIDADE produto_venda_exercicio.quantidade%type,
p_PRECO produto_venda_exercicio.preco%type,
p_VALOR produto_venda_exercicio.valor_total%type,
p_PERCENTUAL produto_venda_exercicio.percentual_imposto%type
)
IS
BEGIN
   INSERT INTO PRODUTO_VENDA_EXERCICIO 
   (id, cod_produto, data, quantidade, preco, valor_total, percentual_imposto) 
   VALUES 
   (p_ID, p_COD_PRODUTO, p_DATA, p_QUANTIDADE, p_PRECO, p_VALOR, p_PERCENTUAL);
    COMMIT;
END; 

EXECUTE INCLUINDO_DADOS_VENDA(2, '92347', TO_DATE('01/01/2022','DD/MM/YYYY'),200, 25);