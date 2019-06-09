/* Lógico_1.brM3_V1: */

CREATE TABLE ESPECIALIDADE (
    cod_especialidade INTEGER,
    cod_medico INTEGER
);

CREATE TABLE CAD_ESPECIALIDADE (
    cod_especialidade INTEGER PRIMARY KEY,
    especialidade VARCHAR(60)
);

CREATE TABLE MEDICO (
    cod_medico INTEGER PRIMARY KEY,
    nome_medico VARCHAR(100),
    crm INTEGER,
    cod_estado INTEGER
);

CREATE TABLE HOSPITAL (
    cod_hospital INTEGER PRIMARY KEY,
    hospital VARCHAR(60)
);

CREATE TABLE TRATAMENTO (
    cod_tratamento INTEGER PRIMARY KEY,
    cod_paciente INTEGER,
    cod_medico INTEGER,
    cod_indisposicao INTEGER,
    ini_trat DATE,
    fim_trat DATE,
    cod_hospital INTEGER
);

CREATE TABLE PACIENTE (
    cod_paciente INTEGER PRIMARY KEY,
    nome_paciente VARCHAR(100),
    peso FLOAT,
    altura FLOAT,
    data_nascimento DATE,
    cpf BIGINT,
    cod_end INTEGER
);

CREATE TABLE ENDERECO (
    cod_end INTEGER PRIMARY KEY,
    cod_rua INTEGER,
    cep INTEGER,
    num_complemento INTEGER,
    num_residencia INTEGER
);

CREATE TABLE ESTADO (
    cod_estado INTEGER PRIMARY KEY,
    estado VARCHAR(50)
);

CREATE TABLE CIDADE (
    cod_cidade INTEGER PRIMARY KEY,
    cidade VARCHAR(100),
    cod_estado INTEGER
);

CREATE TABLE BAIRRO (
    cod_bairro INTEGER PRIMARY KEY,
    bairro VARCHAR(100),
    cod_cidade INTEGER
);

CREATE TABLE INDISPOSICAO (
    indisposicao VARCHAR(100),
    cod_indisposicao INTEGER PRIMARY KEY
);

CREATE TABLE MEDICAMENTO (
    cod_tratamento INTEGER,
    cod_medicamento INTEGER
);

CREATE TABLE CAD_MEDICAMENTO (
    cod_medicamento INTEGER PRIMARY KEY,
    medicamento VARCHAR(100)
);

CREATE TABLE Rua (
    cod_bairro INTEGER,
    rua VARCHAR(100),
    cod_rua INTEGER PRIMARY KEY
);
 
ALTER TABLE ESPECIALIDADE ADD CONSTRAINT ESPECIALIDADE_COD_MEDICO_FKEY
    FOREIGN KEY (cod_medico)
    REFERENCES MEDICO (cod_medico) MATCH FULL
    ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ESPECIALIDADE ADD CONSTRAINT ESPECIALIDADE_COD_ESPECIALIDADE_FKEY
    FOREIGN KEY (cod_especialidade)
    REFERENCES CAD_ESPECIALIDADE (cod_especialidade) MATCH FULL
    ON UPDATE CASCADE ON DELETE CASCADE;
 
ALTER TABLE MEDICO ADD CONSTRAINT MEDICO_COD_ESTADO_FKEY
    FOREIGN KEY (cod_estado)
    REFERENCES ESTADO (cod_estado) MATCH FULL
    ON UPDATE CASCADE ON DELETE CASCADE;
 
ALTER TABLE TRATAMENTO ADD CONSTRAINT TRATAMENTO_COD_HOSPITAL_FKEY
    FOREIGN KEY (cod_hospital)
    REFERENCES HOSPITAL (cod_hospital) MATCH FULL
    ON UPDATE CASCADE ON DELETE CASCADE;
 
ALTER TABLE TRATAMENTO ADD CONSTRAINT TRATAMENTO_COD_INDISPOSICAO_FKEY
    FOREIGN KEY (cod_indisposicao)
    REFERENCES INDISPOSICAO (cod_indisposicao) MATCH FULL
    ON UPDATE CASCADE ON DELETE CASCADE;
 
ALTER TABLE TRATAMENTO ADD CONSTRAINT TRATAMENTO_COD_MEDICO_FKEY
    FOREIGN KEY (cod_medico)
    REFERENCES MEDICO (cod_medico) MATCH FULL
    ON UPDATE CASCADE ON DELETE CASCADE;
 
ALTER TABLE TRATAMENTO ADD CONSTRAINT TRATAMENTO_COD_PACIENTE_FKEY
    FOREIGN KEY (cod_paciente)
    REFERENCES PACIENTE (cod_paciente) MATCH FULL
    ON UPDATE CASCADE ON DELETE CASCADE;
 
ALTER TABLE PACIENTE ADD CONSTRAINT PACIENTE_COD_END_FKEY
    FOREIGN KEY (cod_end)
    REFERENCES ENDERECO (cod_end) MATCH FULL
    ON UPDATE CASCADE ON DELETE CASCADE;
 
ALTER TABLE ENDERECO ADD CONSTRAINT ENDERECO_COD_RUA_FKEY
    FOREIGN KEY (cod_rua)
    REFERENCES Rua (cod_rua) MATCH FULL
    ON UPDATE CASCADE ON DELETE CASCADE;
 
ALTER TABLE CIDADE ADD CONSTRAINT CIDADE_COD_ESTADO_FKEY
    FOREIGN KEY (cod_estado)
    REFERENCES ESTADO (cod_estado) MATCH FULL
    ON UPDATE CASCADE ON DELETE CASCADE;
 
ALTER TABLE BAIRRO ADD CONSTRAINT BAIRRO_COD_CIDADE_FKEY
    FOREIGN KEY (cod_cidade)
    REFERENCES CIDADE (cod_cidade) MATCH FULL
    ON UPDATE CASCADE ON DELETE CASCADE;
 
ALTER TABLE MEDICAMENTO ADD CONSTRAINT MEDICAMENTO_COD_TRATAMENTO_FKEY
    FOREIGN KEY (cod_tratamento)
    REFERENCES TRATAMENTO (cod_tratamento) MATCH FULL
    ON UPDATE CASCADE ON DELETE CASCADE;
 
ALTER TABLE MEDICAMENTO ADD CONSTRAINT MEDICAMENTO_COD_MEDICAMENTO_FKEY
    FOREIGN KEY (cod_medicamento)
    REFERENCES CAD_MEDICAMENTO (cod_medicamento) MATCH FULL
    ON UPDATE CASCADE ON DELETE CASCADE;
 
ALTER TABLE RUA ADD CONSTRAINT RUA_COD_BAIRRO_FKEY 
    FOREIGN KEY (cod_bairro)
    REFERENCES BAIRRO (cod_bairro) MATCH FULL
    ON UPDATE CASCADE ON DELETE CASCADE;

insert into estado (cod_estado,estado) values (21,'Espirito Santo'),(10,'Pará'),
(12,'Maranhão'),(30,'Pernambuco'),(22,'Rio Grande do Sul'),(63,'Paraná'),
(27,'Rio de Janeiro'),(66,'Bahia'),(33,'Minas Gerais'),(11,'São Paulo'); 	

insert into cidade (cod_cidade,cidade,cod_estado) values (1,'Vitória',21),(2,'Santarém',10),(3,'São Luís',12),
(4,'Alagoinhas',30),(5,'Serra',21),(6,'Curitiba',22),(7,'Rio de Janeiro',27),(8,'Mucuri',66),(9,'Teofilo Otoni',33),(10,'São Paulo',11);

insert into bairro (cod_bairro,bairro,cod_cidade) values (2,'Jardim da Penha',1),(5,'Prainha',2),
(7,'Areinha',3),(12,'Centro',4),(36,'São Diogo',5),(25,'Boa Vista',6),(22,'Leblon',7),
(56,'Mucuri',8),(13,'Matinha',9),(10,'Morumbi',10);

insert into rua (cod_bairro,rua,cod_rua) values (2,'Rua L',10),(5,'Rua N',20),
(7,'Rua Acacia',30),(12,'Rua Brasil',40),(36,'Rua X',50),(25,'Rua Z',60),(22,'Rua H',70),
(56,'Rua das Amoras',80),(13,'Rua J',90),(10,'Rua Morumbi',100);

insert into endereco (cod_end,cod_rua,cep,num_complemento,num_residencia) values 
(5,10,100001,null,10),(2,20,100002,202,350),(6,30,100002,null,1201),
(8,40,100002,203,350),(58,50,100005,405,534),(63,60,100006,502,7),(1,70,100007,null,25),
(4,80,100008,520,520),(9,90,100009,1000,301),(22,100,100010,null,6969);

insert into paciente (cod_paciente,nome_paciente,peso,altura,data_nascimento,cpf,cod_end) values 
(1,'José Alves',60,1.75,'1957-01-12',12378912503,5),(2,'Maria Souza',75.5,1.82,'2011-04-11',57687025109,2),
(3,'Pedro Santos',78.4,1.80,'1998-02-12',77206186707,6),(4,'João Pedro',92.8,1.85,'1962-10-05',24305085206,8),
(5,'Ana Kruger Santos',55,1.57,'1999-12-24',16206186708,58),(6,'Miguel Pereira',69.8,1.78,'1951-05-12',16802586906,63),
(7,'Davi Santos',100.1,1.90,'1996-06-18',11205086701,1),(8,'Clarice Pereira Silva',70.5,1.55,'2000-10-16',12305886107,4),
(9,'Joana Medeiros',80.3,1.60,'1995-07-04',20001487008,9),(10,'Thiago Correia Neves',88.6,1.80,'1991-08-13',16106186707,22);

insert into medico (cod_medico,nome_medico,crm,cod_estado) values 
(11,'Carlos Martins',492585,21),(21,'Joice da Penha',524818,27),
(31,'Gustavo Carvalho',345835,33),(41,'Alfredo Guerra Tutsk',911505,11),
(51,'Carlos Silva',493945,66),(61,'Priscila Catrina',758515,11),
(71,'Flávio Jukes Silva',761258,12),(81,'José Santos',121168,63),
(91,'Vinicius Marroco',211164,27),(101,'Sabrina Fantin',671241,21);

insert into cad_especialidade (cod_especialidade,especialidade) values (1,'Clínico geral'),
(7,'Radiologia'),(9,'Urologia'),(10,'Radioterapia'),(12,'Nutrologia'),
(14,'Neurocirurgia'),(16,'Neurologia'),(13,'Oftamologia'),(21,'Psiquiatria');
INSERT INTO CAD_ESPECIALIDADE (COD_ESPECIALIDADE,ESPECIALIDADE) VALUES (5,'Medicina do Trabalho');

insert into especialidade (cod_especialidade,cod_medico) values (1,11),
(5,21),(7,11),(9,41),(10,51),(12,61),(14,71),(16,81),(13,91),(21,21);

INSERT INTO CAD_MEDICAMENTO (cod_medicamento, medicamento)
VALUES  (1,'Diclofenaco'),(2,'Aerolin/Berotec'),(3,'Cloridrato de Ciprofloxacino'),
(4,'Alprazolam'),(5,'Vertizan'),(6,'Atenolol'),(7,'Ceftriaxona Sodica'),
(8,'Oximetazolina/Fluticasona'),(9,'Colírio Maxitrol'),(10,'Fluoxetina');

INSERT INTO HOSPITAL (cod_hospital, hospital)
VALUES (10,'Hospital Vitória Apart'),(20,'Hospital São Camilo'),
(30, 'Hospital São Domingos'),(40,'Hospital Regional Dantas Biao'),
(50,'Clínica Viver Bem'),(60,'Hospital Santa Cruz'),(70,'Hospital São Lucas Copacabana'),
(80,'Hospital Paineiras'),(90,'Hospital Santa Rosália'),(100,'Hospital Israelita Albert Einstein');

INSERT INTO INDISPOSICAO (cod_indisposicao, indisposicao)
VALUES(10,'Gripe'),(20,'Asma'),(30,'Pneumonia'),(40,'Insônia'),
(50,'Labirintite'),(60,'Pressão alta'),(70,'Gastroenterite'),
(80,'Sinusite'),(90,'Conjuntivite'),(100,'Depressão');

INSERT INTO TRATAMENTO (cod_tratamento,cod_paciente,cod_medico,cod_indisposicao,ini_trat,fim_trat,cod_hospital)
VALUES (1,1,11,10,'15-11-2017','20-11-2017',10),(2,2,21,20,'02-03-2017', '01-04-2017',20),(3,3,31,30,'14-12-2018','28-12-2018',30),
(4,4,41,40,'18-02-2017',NULL,40),(5,5,51,50,'16-02-2019','02-03-2019',50),(6,6,61,60,'10-08-2016',NULL,60),(7,7,71,70,'05-09-2018','10-09-2018',70),
(8,8,81,80,'02-09-2017','17-09-2017',80),(9,9,91,90,'16-08-2015','23-08-2015',90),(10,10,101,100,'17-06-2017',NULL,100);

INSERT INTO MEDICAMENTO (cod_tratamento,cod_medicamento)
VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);

ALTER TABLE CIDADE DROP CONSTRAINT CIDADE_COD_ESTADO_FKEY;
ALTER TABLE BAIRRO DROP CONSTRAINT BAIRRO_COD_CIDADE_FKEY;
ALTER TABLE RUA DROP CONSTRAINT RUA_COD_BAIRRO_FKEY;
ALTER TABLE MEDICO DROP CONSTRAINT MEDICO_COD_ESTADO_FKEY;
ALTER TABLE ENDERECO DROP CONSTRAINT ENDERECO_COD_RUA_FKEY;
ALTER TABLE ESPECIALIDADE DROP CONSTRAINT ESPECIALIDADE_COD_MEDICO_FKEY;
ALTER TABLE ESPECIALIDADE DROP CONSTRAINT ESPECIALIDADE_COD_ESPECIALIDADE_FKEY;
ALTER TABLE PACIENTE DROP CONSTRAINT PACIENTE_COD_END_FKEY;
ALTER TABLE MEDICAMENTO DROP CONSTRAINT MEDICAMENTO_COD_MEDICAMENTO_FKEY;
ALTER TABLE MEDICAMENTO DROP CONSTRAINT MEDICAMENTO_COD_TRATAMENTO_FKEY;
ALTER TABLE TRATAMENTO DROP CONSTRAINT TRATAMENTO_COD_HOSPITAL_FKEY;
ALTER TABLE TRATAMENTO DROP CONSTRAINT TRATAMENTO_COD_INDISPOSICAO_FKEY;
ALTER TABLE TRATAMENTO DROP CONSTRAINT TRATAMENTO_COD_MEDICO_FKEY;
ALTER TABLE TRATAMENTO DROP CONSTRAINT TRATAMENTO_COD_PACIENTE_FKEY;

DROP TABLE ESTADO;
DROP TABLE CIDADE;
DROP TABLE BAIRRO;
DROP TABLE RUA;
DROP TABLE ENDERECO;
DROP TABLE PACIENTE;
DROP TABLE CAD_ESPECIALIDADE;
DROP TABLE ESPECIALIDADE;
DROP TABLE MEDICO;
DROP TABLE HOSPITAL;
DROP TABLE CAD_MEDICAMENTO;
DROP TABLE MEDICAMENTO;
DROP TABLE INDISPOSICAO;
DROP TABLE TRATAMENTO;