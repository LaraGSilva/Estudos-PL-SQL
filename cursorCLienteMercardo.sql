set serveroutput on;

declare
    v_clienteMercado  cliente_mercado%rowtype;
    cursor cursor_cliente is
        select id, UPPER(razao_social) from cliente_mercado order by id;
begin
    open cursor_cliente;
    loop
        fetch cursor_cliente into v_clienteMercado.id, v_clienteMercado.razao_social;
        exit when cursor_cliente%notfound;
            dbms_output.put_line(v_clienteMercado.id ||' '|| v_clienteMercado.razao_social);
     end loop;
    close cursor_cliente;
end;        

select * from cliente_mercado;
     

CREATE TABLE TAB_FETCH
(ID INTEGER, NOME VARCHAR(10), VALOR VARCHAR(10));
INSERT INTO TAB_FETCH VALUES (1,'PRODUTO1',10);
INSERT INTO TAB_FETCH VALUES (2,'PRODUTO2',10);
INSERT INTO TAB_FETCH VALUES (3,'PRODUTO3',10);
INSERT INTO TAB_FETCH VALUES (4,'PRODUTO4',10);
INSERT INTO TAB_FETCH VALUES (5,'PRODUTO5',10);
INSERT INTO TAB_FETCH VALUES (6,'PRODUTO6',10);
INSERT INTO TAB_FETCH VALUES (7,'PRODUTO7',10);
INSERT INTO TAB_FETCH VALUES (8,'PRODUTO8',10);
INSERT INTO TAB_FETCH VALUES (9,'PRODUTO9',10);

declare
    v_produto   TAB_FETCH%rowtype;
    cursor cur_fetch is
        select id, valor from TAB_FETCH where mod(id,2) = 0;
    valor_acumulativo float := 0;
begin
    open cur_fetch;
    loop
        fetch cur_fetch into v_produto.id, valor_acumulativo;
        exit when valor_acumulativo >=30;
        
        valor_acumulativo := valor_acumulativo + v_produto.valor;
    end loop;
    close cur_fetch;
end;


SET SERVEROUTPUT ON;
DECLARE
   v_NOME TAB_FETCH.nome%type;
   v_VALOR TAB_FETCH.valor%type;
   v_VALOR_ACUMULATIVO TAB_FETCH.valor%type:=0;
   CURSOR cur_TABFETCH IS SELECT NOME, VALOR FROM TAB_FETCH WHERE MOD(ID,2) = 0;
BEGIN
   OPEN cur_TABFETCH;
   FETCH cur_TABFETCH INTO v_NOME, v_VALOR;
   LOOP
       v_VALOR_ACUMULATIVO := v_VALOR_ACUMULATIVO + v_VALOR;
   EXIT WHEN v_VALOR_ACUMULATIVO >= 30;
       FETCH cur_TABFETCH INTO v_NOME, v_VALOR;
   END LOOP;
   CLOSE cur_TABFETCH;
   dbms_output.put_line('VALOR DO PRODUTO = ' || v_NOME);
END;


declare 
 v_segmercado cliente_mercado.seg_mercado_id%type;
 v_id   cliente_mercado.id%type;
 cursor cur_cliente is select id from cliente_mercado;
begin
    open cur_cliente;
    loop
        fetch cur_cliente into v_id;
    exit when cur_cliente%NOTFOUND;
        atualizar_segmercado(v_id, v_segmercado);
    end loop;
    close cur_cliente;
end;

declare 
 v_segmercado cliente_mercado.seg_mercado_id%type;
 v_id   cliente_mercado.id%type;
 cursor cur_cliente is select id from cliente_mercado;
begin
    open cur_cliente;
    fetch cur_cliente into v_id;
    while cur_client%FOUND loop
        atualizar_segmercado(v_id, v_segmercado);
        fetch cur_cliente into v_id;
    end loop;
    close cur_cliente;
end;



create or replace PROCEDURE SOMA_VENDAS_CURSOR 
(p_VENDA_LIMITE IN produto_venda_exercicio.valor_total%type, p_ID_RETORNO OUT produto_venda_exercicio.id%type)
IS
   v_ID produto_venda_exercicio.id%type := 1;
   v_VALOR_TOTAL produto_venda_exercicio.valor_total%type;
   v_VENDA_TOTAL produto_venda_exercicio.valor_total%type := 0;
   CURSOR cur_VENDA IS SELECT ID FROM PRODUTO_VENDA_EXERCICIO;
BEGIN
   OPEN cur_VENDA;
   LOOP
      FETCH cur_VENDA INTO v_ID;
      SELECT VALOR_TOTAL INTO v_VALOR_TOTAL FROM PRODUTO_VENDA_EXERCICIO WHERE ID = v_ID;
      v_VENDA_TOTAL := v_VENDA_TOTAL + v_VALOR_TOTAL;
      IF v_VENDA_TOTAL >= p_VENDA_LIMITE THEN
         EXIT;
      END IF;
      EXIT WHEN cur_VENDA%NOTFOUND;
   END LOOP;
   CLOSE cur_VENDA;
   p_ID_RETORNO := v_ID;
END;

SET SERVEROUTPUT ON;
DECLARE
   v_NUM INTEGER;
BEGIN
   SOMA_VENDAS_CURSOR(20000, v_NUM);
   dbms_output.put_line(v_NUM);
END;


DECLARE
    v_SEGMERCADO CLIENTE.SEGMERCADO_ID%type := 1;
    CURSOR cur_CLPENTE IS SELECT ID FROM CLIENTE;
BEGIN
    FOR linha_cur_CLIENTE IN cur_CLIENTE LOOP
        ATUALIZARSEGMERCADO (linha_cur_CLIENTE.ID, v_SEGMERCADO);
    END LOOP;
END;