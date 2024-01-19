DROP TABLE alunos;
DROP TABLE disciplina;
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
    cod_disc     INT NOT NULL,
    nome_disc    VARCHAR2(30) NOT NULL,
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
    CONSTRAINT pk_cod_turma PRIMARY KEY(cod_disc, cod_turma, cod_prof),
    CONSTRAINT fk_cod_disc_turma FOREIGN KEY (cod_disc) REFERENCES disciplina(cod_disc) ON DELETE CASCADE,
    CONSTRAINT fk_cod_prof_turma  FOREIGN KEY (cod_prof) REFERENCES professor(cod_prof) ON DELETE CASCADE
);
desc turma;

CREATE TABLE historico (
    mat           INT NOT NULL,
    cod_disc      INT NOT NULL,
    cod_turma     INT NOT NULL,
    cod_prof      INT NOT NULL,
    ano_turma     INT,
    frequencia    INT,
    nota          INT,
    CONSTRAINT fk_cod_mat FOREIGN KEY (mat) REFERENCES alunos(mat),
    CONSTRAINT fk_cod_historico FOREIGN KEY (cod_disc, cod_turma, cod_prof) REFERENCES turma(cod_disc, cod_turma, cod_prof) ON DELETE CASCADE,
    CONSTRAINT fk_cod_ano_historico FOREIGN KEY (ano_turma) REFERENCES turma(ano_turma) ON DELETE CASCADE
);
