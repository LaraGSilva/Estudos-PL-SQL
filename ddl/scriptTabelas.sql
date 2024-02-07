 drop table cliente_mercado;
drop table segmercado;
drop table produto_exc;
drop table produto_venda_exc;

create table segmercado(
id  number(5),
descricao varchar2(100),
constraint PK_ID_segmercado primary key(id));

create table cliente_mercado (
id number(5),
seg_mercado_id number(5),
razao_social varchar2(100),
cnpj varchar2(20),
data_inclusao date,
faturamnto_previsto number(10,2),
categoria varchar2(100),
constraint PK_ID_cliente primary key (id),
constraint FK_ID_seg foreign key(seg_mercado_id) references segmercado(id));


create table produto_exc(
cod varchar2(5),
descricao varchar(100),
categoria varchar2(100),
constraint PK_COD primary key (cod));

create table produto_venda_exc(
id number(5),
cod_produto VARCHAR2(5),
data date,
quantidade float (126),
preco float(126),
valor_total float(126),
percentual_imposto float(126),
constraint PK_ID_produto primary key(id),
constraint FK_COD_PRODUTO foreign key (cod_produto) references produto_exc(cod));

commit;