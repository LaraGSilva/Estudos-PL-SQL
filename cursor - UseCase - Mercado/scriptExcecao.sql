select * from cliente_mercado;

execute incluir_cliente(13, 1,'cliente novo', '12345434', 95000);
execute incluir_cliente(null, 1,'cliente novo', '12345434', 95000);

set serveroutput on;

create or replace procedure incluir_cliente
(
    p_id  cliente_mercado.id%type, 
    p_seg_mercado_id  cliente_mercado.seg_mercado_id%type,
    p_razao_social cliente_mercado.razao_social%type,
    p_cnpj cliente_mercado.cnpj%type,
    p_faturamento_previsto  cliente_mercado.faturamnto_previsto%type
)

is
    v_cnpj cliente_mercado.cnpj%type;
    v_categoria cliente_mercado.categoria%type;
    e_idNULO  exception;
    pragma exception_init(e_idNULO,-1400);
    e_faturamentoNulo  exception;
    
begin
    if p_faturamento_previsto is null then
        raise e_faturamentoNulo;
    end if;
    formata_cnpj(p_cnpj, v_cnpj);
    v_categoria := obter_categoria_cliente_mercado(p_faturamento_previsto);
    insert into cliente_mercado
    (id,seg_mercado_id, razao_social,cnpj,data_inclusao,faturamnto_previsto,categoria) 
    values (p_id, p_seg_mercado_id,p_razao_social,v_cnpj,SYSDATE,p_faturamento_previsto,v_categoria);
    commit; 
    
exception
    when DUP_VAL_ON_INDEX  then
        raise_application_error(-20010,'ESSE CLIENTE JA EXISTE NO BANCO DE DADOS');
    when e_idNulo   then
        raise_application_error(-20015,'IDENTIFICADOR NAO PODE SER NULO');
    when e_faturamentoNulo  then
        raise_application_error(-20020,'FATURAMENTO NULO');
    when others then
        raise_application_error(-20025, 'ERRO NÃO ESPERADO');
end;

-------------------------------

DECLARE  
  e_meu_erro EXCEPTION;  
  PRAGMA EXCEPTION_INIT (e_meu_erro, -2292);
BEGIN  
  DELETE FROM dept   
    WHERE deptno = 10;  
  COMMIT;
EXCEPTION  
  WHEN  e_meu_erro  THEN   
    DBMS_OUTPUT.PUT_LINE ('Integridade Referencial Violada');   
    ROLLBACK;
END;
/