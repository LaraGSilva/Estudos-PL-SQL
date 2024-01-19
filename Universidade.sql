DROP TABLE alunos;
DROP TABLE disciplina;
ALTER TABLE disciplina DROP CONSTRAINT pk_cod_disc;
DROP TABLE professor;
DROP TABLE turma;
DROP TABLE historico;

CREATE TABLE alunos(
    mat       INT NOT NULL,
    nome      VARCHAR2(20),
    endereco  VARCHAR2(30),
    cidade    VARCHAR2(30),
    CONSTRAINT pk_mat PRIMARY KEY(mat)
);

CREATE TABLE disciplina(
    cod_disc     VARCHAR2(50) NOT NULL,
    nome_disc    VARCHAR2(50) NOT NULL,
    carga_hor    FLOAT,
    CONSTRAINT pk_cod_disc PRIMARY KEY(cod_disc)
);

CREATE TABLE professor(
    cod_prof  INT NOT NULL,
    nome      VARCHAR2(20),
    endereco  VARCHAR2(30),
    cidade    VARCHAR2(30),
    CONSTRAINT pk_cod_prof PRIMARY KEY(cod_prof)
);

CREATE TABLE turma(
    cod_disc      INT NOT NULL,
    cod_turma     INT NOT NULL,
    cod_prof      INT NOT NULL,
    ano_turma     INT,
    horario_turma FLOAT,
    CONSTRAINT pk_cod_turma PRIMARY KEY(cod_disc, cod_turma, cod_prof,ano_turma),
    CONSTRAINT fk_cod_disc_turma FOREIGN KEY (cod_disc) REFERENCES disciplina(cod_disc) ON DELETE CASCADE,
    CONSTRAINT fk_cod_prof_turma  FOREIGN KEY (cod_prof) REFERENCES professor(cod_prof) ON DELETE CASCADE
);

--desc turma;

CREATE TABLE historico (
    mat           INT NOT NULL,
    cod_disc      INT NOT NULL,
    cod_turma     INT NOT NULL,
    cod_prof      INT NOT NULL,
    ano_turma     INT,
    frequencia    INT,
    nota          INT,
    CONSTRAINT fk_cod_mat FOREIGN KEY (mat) REFERENCES alunos(mat),
    CONSTRAINT fk_cod_historico FOREIGN KEY (cod_disc, cod_turma, cod_prof, ano_turma) REFERENCES turma(cod_disc, cod_turma, cod_prof, ano_turma) ON DELETE CASCADE
);

create or replace procedure inserir_aluno
(p_mat alunos.mat%type, p_nome alunos.nome%type,p_endereco alunos.endereco%type,p_cidade  alunos.cidade%type)
is
begin
    insert into alunos(mat,nome, endereco, cidade) values (p_mat, TRIM(p_nome), TRIM(p_endereco), TRIM(p_cidade));
    commit;
end inserir_aluno;

execute inserir_aluno  (2015010101, 'JOSE DE ALENCAR','RUA DAS ALMAS', 'NATAL') ;
execute inserir_aluno  (2015010102, 'JOÃO JOSÉ', 'AVENIDA RUY CARNEIRO', 'JOÃO PESSOA');
execute inserir_aluno  (2015010103, 'MARIA JOAQUINA', 'RUA CARROSSEL', 'RECIFE');
execute inserir_aluno  (2015010104, 'MARIA DAS DORES','RUA DAS LADEIRAS','FORTALEZA');
execute inserir_aluno  (2015010105, 'JOSUÉ SANTOS', 'CENTRO', 'NATAL');
execute inserir_aluno  (2015010106, 'JOSUÉLISSON SANTOS', 'CENTRO', 'NATAL');


create or replace procedure inserir_disciplina
(p_cod  disciplina.cod_disc%type, p_nome  disciplina.nome_disc%type, p_carga_h  disciplina.carga_hor%type)
is
begin
    insert into disciplina (cod_disc, nome_disc, carga_hor) values (p_cod, p_nome, p_carga_h);
    commit;
end inserir_disciplina;

execute inserir_disciplina  ('BD', 'BANCO DE DADOS', 100);
execute inserir_disciplina  ('POO', 'PROGRAMAÇÃO E BANCO DE DADOS', 100);
execute inserir_disciplina  ('WEB', 'AUTORIA WEB', 50);
execute inserir_disciplina  ('ENG', 'ENGENHARIA DE SOFTWARE', 80);

create or replace procedure inserir_professor 
(p_cod  professor.cod_prof%type, p_nome_prof  professor.nome%type, p_endereco professor.endereco%type, p_cidade professor.cidade%type)
is
begin
    insert into professor (cod_prof, nome, endereco, cidade) values (p_cod, p_nome_prof, p_endereco, p_cidade);
    commit;
end inserir_professor;

execute inserir_professor (212131, 'NICKERSON FERREIRA', 'RUA MANAÍRA', 'JOÃO PESSOA') ;
execute inserir_professor (122135, 'ADORILSON BEZERRA', 'AVENIDA SALGADO FILHO', 'NATAL') ;
execute inserir_professor (192011, 'DIEGO OLIVEIRA', 'AVENIDA ROBERTO FREIRE', 'NATAL');


create or replace procedure inserir_turma
(p_cod_disc  turma.cod_disc%type, p_cod_turma  turma.cod_turma%type, p_cod_prof  turma.cod_prof%type, p_ano_turma  turma.ano_turma%type, p_carga  turma.horario_turma%type)
is
begin
    insert into turma (cod_disc, cod_turma, cod_prof, ano_turma, horario_turma) values (p_cod_disc, p_cod_turma, p_cod_prof, p_ano_turma, p_carga);
    commit;
end inserir_turma;
    
execute inserir_turma(BD, 1, 212131, 2015, 11);
execute inserir_turma(BD, 2, 212131, 2015, 13);
execute inserir_turma(POO, 1, 192011, 2015, 08);
execute inserir_turma(WEB, 1, 192011, 2015, 07);
execute inserir_turma(ENG, 1, 122135, 2015, 1);

