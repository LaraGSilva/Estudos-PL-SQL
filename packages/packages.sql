-- nessa linha de codigo, existe a tentativa do user_app de inserir dados na tabela, mas pelo fato de n ter privilegios para executar tal modificacao na tabela, usamos o insert atraves do usucario da tabela mas mesmo assim n é possivel

insert into user_dev.cliente (id, razao_social, cnpj, segmercado_id, data_inclusao, faturamento, categoria) values( 5, 'lara', 123-33, 2,to_date('12/02/2003','dd/mm/yyyy'));


-- portanto, é necessario realizar a inclusao atraves de procuedrures e funcao para tal
EXECUTE USER_DEV.incluir_cliente ( 5, 'lara', 123-33, 2,to_date('12/02/2003','dd/mm/yyyy'));

-- caso o user_app queira ver como esta tabela que ele acabou de inserir o cliente, é possivel ele realizar o seguinte comando
-- dando privilegio de selecao ao user_app;
grant select  on cliente to user_app;

--Os usuários que podem conceder o privilégio de EXECUTE sobre uma procedure ou função são o dono do código e qualquer outro usuário que tenha o privilégio de sistema EXECUTE ANY PROCEDURE;
--Somente o dono do código, ou os usuários que tenham o privilégio de sistema EXECUTE ANY PROCEDURE, podem conceder privilégios de EXECUTE sobre a procedure ou função. Apesar do privilégio se chamar EXECUTE ANY PROCEDURE, vale tanto para procedure quanto para função.

--SINONIMOS: O sinônimo funciona como um apelido, um nome fantasia que podemos atribuir ao componente.
--Dessa forma, qualquer usuário que tenha acesso pode chamar o objeto pelo seu sinônimo, sem precisar especificar o dono. É importante lembrar que o dono do objeto é quem cria o sinônimo. Sendo assim, vamos criar um novo script com o USER_DEV (para isso, basta clicar no ícone do sql e escolher a opção "user_dev"), que é o dono do objeto, para criar sinônimos para as 4 procedures às quais demos acesso e também para a tabela CLIENTE, permitindo assim a seleção na tabela sem a necessidade de especificar o dono.
-- Utilizando-se sinônimos, se cria uma camada de abstração no banco de dados, assim pode-se fazer a alteração na estrutura do banco. Por exemplo: uma procedure muda de dono, mas mantém o mesmo sinônimo, com um mínimo de impacto nas aplicações.
create public synonym cliente for user_dev.cliente;

-- criando pacotes
create or replace package cliente_pac
is

    PROCEDURE INCLUIR_CLIENTE
        (p_id in cliente.id%type,
        p_razao_social in cliente.razao_sociao%type,
        p_CNPJ cliente.CNPJ%type ,
        p. segmercado_id cliente.segmercado_id%type,
        p_faturamento_previsto cliente.faturamento_previsto%type);

end;

CREATE OR REPLACE PACKAGE BODY CLIENTE_PAC
IS
PROCEDURE INCLUIR_CLIENTE 
    (p_id in cliente.id%type,
    p_razao_social in cliente.razao_social%type,
    p_CNPJ cliente.CNPJ%type ,
    p_segmercado_id cliente.segmercado_id%type,
    p_faturamento_previsto cliente.faturamento_previsto%type)
IS
    v_categoria cliente.categoria%type;
    v_CNPJ cliente.cnpj%type := p_CNPJ;
    v_codigo_erro number(5);
    v_mensagem_erro varchar2(200);
    v_dummy number;
    v_verifica_segmento boolean;
    e_segmento exception;
BEGIN
    v_verifica_segmento :=     verifica_segmento_mercado(p_segmercado_id);
    IF v_verifica_segmento = false THEN
        RAISE e_segmento;
    END IF;
    v_categoria := obter_categoria_cliente(p_faturamento_previsto);
    format_cnpj (v_cnpj);
    INSERT INTO cliente 
            VALUES (p_id, UPPER(p_razao_social), v_CNPJ, p_segmercado_id
                    ,SYSDATE, p_faturamento_previsto, v_categoria);
    COMMIT;   
EXCEPTION
    WHEN dup_val_on_index then
        raise_application_error(-20010,'Cliente já cadastrado');
    WHEN e_segmento then
        raise_application_error (-20011,'Segmento de mercado inexistente');
    WHEN OTHERS then
        v_codigo_erro := sqlcode;
        v_mensagem_erro := sqlerrm;
        raise_application_error (-20000,to_char(v_codigo_erro)||v_mensagem_erro);
END;

END;

grant execute on cliente_pac to user_app;

execute user_dev.cliente_pac.incluir_cliente(10,'farmacia',123456, 1, 23455445);
create public synonym cliente_pac for user_dev.cliente_pac;

execute cliente_pac.excluir_cliente(10);