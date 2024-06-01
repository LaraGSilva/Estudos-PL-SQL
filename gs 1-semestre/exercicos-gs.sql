''' 1) Utilizando a estrutura WITH/CTE, escreva uma consulta SQL que calcule a temperatura média em cada local com base nas informações de condições ambientais.
Exiba o nome de cada local junto com sua respectiva temperatura média. Atenção: Soluções diferentes da instrução WITH serão consideradas incorretas ''' 

''' 
Utilizando as tabelas localizacoes, condicoes_ambientais e poluicoes, escreva uma consulta para exibir o nome da localização, a data das condições ambientais, o tipo de poluente e a média da temperatura, ordenando os resultados pelos nomes das localizações, datas das condições ambientais e tipos de poluentes das localizações 'Baía de Guanabara' e 'Recife de Tubbataha', para os poluentes 'Sedimentos' e 'Mercúrio'.
'''

''' 
) Antes de realizar esse exercício, execute as instruções a seguir:
   drop table poluicoes_grave;
   drop table poluicoes_comum;
   CREATE TABLE poluicoes_grave (
       poluicao_id INT PRIMARY KEY,
       localizacao_id INT,
       data DATE,
tipo_poluente VARCHAR2(50),
concentracao FLOAT,
descricao CLOB,
nome_localizacao VARCHAR2(100),
FOREIGN KEY (localizacao_id)
   localizacoes(localizacao_id));
   CREATE TABLE poluicoes_comum (
       poluicao_id INT PRIMARY KEY,
       localizacao_id INT,
       data DATE,
tipo_poluente VARCHAR2(50),
concentracao FLOAT,
descricao CLOB,
nome_localizacao VARCHAR2(100),
FOREIGN KEY (localizacao_id)
   localizacoes(localizacao_id));

   Escreva UMA instrução para inserir em massa os dados nas tabelas poluicoes_grave e poluicoes_comum com base na concentração dos poluentes, de acordo com a regra a seguir:
• Se a concentração for maior que 10, insira na tabela poluicoes_grave.
• Caso contrário, insira na tabela poluicoes_comum.
Atenção: É para escrever a instrução com um insert. Soluções com mais de um insert serão consideradas incorretas.

'''

'''
Você é um analista de dados encarregado de criar uma visão que permita uma análise mais eficiente dos dados de poluição em diferentes localizações. Sua tarefa é criar uma visão chamada "VisaoPoluicao" que contenha as seguintes informações:
• O nome da localização.
• A data da ocorrência da poluição.
• O tipo de poluente.
• A concentração do poluente.
REFERENCES
Ordene a saída por ordem crescente concentração.
Atenção, garanta que nenhuma operação DML seja executada por meio a utilização da visão.
Após consultar a visão a saída deve ser a seguinte:
select * from visaopoluicao;

'''

with loc_med as (
        select l.localizacao_id, l.nome, c.temperatura
        from PF0645.LOCALIZACOES l
        left join PF0645.CONDICOES_AMBIENTAIS c
        on l.localizacao_id = c.localizacao_id
    ),
    avg_temp as (select nome, ROUND(AVG(temperatura), 2) from loc_med group by nome)
    select * from avg_temp
    order by nome asc;


select l.nome,  c.data, p.tipo_poluente, AVG(c.temperatura)
from PF0645.LOCALIZACOES l 
left join PF0645.CONDICOES_AMBIENTAIS c on l.localizacao_id = c.localizacao_id
left join PF0645.POLUICOES p on l.localizacao_id = p.localizacao_id
where p.tipo_poluente in ('Sedimentos','Mercúrio') and l.nome in ('Baía de Guanabara', 'Recife de Tubbataha')
group by l.nome, c.data, p.tipo_poluente
order by l.nome asc, c.data asc, p.tipo_poluente asc; 