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

insert into especialidade (cod_especialidade,cod_medico) values (1,11),
(5,21),(7,11),(9,41),(10,51),(12,61),(14,71),(16,81),(13,91),(21,21);

INSERT INTO CAD_MEDICAMENTO (cod_medicamento, medicamento)
VALUES  (1,'Diclofenaco'),(2,'Aerolin/Berotec'),(3,'Cloridrato de Ciprofloxacino'),
(4,'Alprazolam'),(5,'Vertizan'),(6,'Atenolol'),(7,'Ceftriaxona Sodica'),
(8,'Oximetazolina/Fluticasona'),(9,'Colírio Maxitrol'),(10,'Fluoxetina'),;

INSERT INTO HOSPITAL (cod_hospital, hospital)
VALUES (10,'Hospital Vitória Apart'),(20,'Hospital São Camilo'),
(30, 'Hospital São Domingos'),(40,'Hospital Regional Dantas Biao'),
(50,'Clínica Viver Bem'),(60,'Hospital Santa Cruz'),(70,'Hospital São Lucas Copacabana'),
(80,'Hospital Paineiras'),(90,'Hospital Santa Rosália'),(100,'Hospital Israelita Albert Einstein');
INSERT INTO CAD_ESPECIALIDADE (COD_ESPECIALIDADE,ESPECIALIDADE) VALUES (5,'Medicina do Trabalho');

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

insert into cad_medicamento (cod_medicamento,medicamento) values (11,'Benegrip'),(12,'Multigrip'),(13,'Paracetamol'),(14,'Dipirona'),(15,'Labirin'),(16,'Vertix');
insert into cad_medicamento (cod_medicamento,medicamento) values (15,'Labirin'),(16,'Vertix');
insert into cad_medicamento (cod_medicamento,medicamento) values (17,'Astro'),(18,'Avalox'),(19,'Azitromicina');
insert into cad_medicamento (cod_medicamento,medicamento) values (20,'Maxitrol'),(21,'Zypred'),(22,'Vigamox'),(23,'Colirio Dest'),(24,'Colirio BGrau');

insert into indisposicao (indisposicao,cod_indisposicao) values ('Dengue',14),('Catarata',15);
insert into cad_especialidade (cod_especialidade,especialidade) values (11,'Infectologista');
insert into especialidade (cod_especialidade,cod_medico) values (11,11),(11,101),(1,11),(11,91),(1,91),(13,101);
insert into especialidade (cod_especialidade,cod_medico) values (11,11),(11,101),(1,11),(11,91),(1,91),(13,101);
insert into especialidade (cod_especialidade,cod_medico) values (11,71),(12,71);

insert into medicamento (cod_tratamento,cod_medicamento) values (12,12),(12,11),(12,14);
insert into medicamento (cod_tratamento,cod_medicamento) values (5,15),(5,16);
insert into medicamento (cod_tratamento,cod_medicamento) values (11,17),(3,17),(3,18),(3,19);
insert into medicamento (cod_tratamento,cod_medicamento) values (11,18);

insert into tratamento (cod_tratamento,cod_paciente,cod_medico,cod_indisposicao,ini_trat,fim_trat,cod_hospital) 
values (13,1,11,14,'2018-05-21',NULL,11),(14,1,101,30,'2019-05-01',NULL,10),(15,10,41,50,'2018-12-25','2019-02-07',100),
(16,7,91,90,'2019-04-15',NULL,70),(17,7,21,12,'2018-05-30','2018-06-04',70),(18,8,51,15,'2017-02-10','2017-03-01',40),
(19,8,51,90,'2019-05-10',NULL,40),(20,1,101,15,'2019-06-01',NULL,11);
insert into tratamento (cod_tratamento,cod_paciente,cod_medico,cod_indisposicao,ini_trat,fim_trat,cod_hospital) 
values (21,7,21,30,'2018-12-30',NULL,70);

insert into medicamento (cod_tratamento,cod_medicamento) values (13,13),(13,14),(14,18),(14,19),(15,16),(15,15),(16,21),(16,22),(16,20),(17,11),(17,12),(17,14),
(18,23),(18,24),(19,23),(19,20),(19,21),(19,22),(19,24),(20,22),(21,17),(21,18);

insert into especialidade (cod_especialidade,cod_medico) values (13,91),(13,21),(11,91);
insert into especialidade (cod_especialidade,cod_medico) values (11,51),(12,51);
insert into especialidade (cod_especialidade,cod_medico) values (11,21);

insert into medicamento (cod_tratamento,cod_medicamento) values (14,17);

ALTER TABLE PACIENTE ADD COLUMN SEXO VARCHAR(2);

UPDATE PACIENTE SET SEXO = 'F' WHERE COD_PACIENTE = 2;
UPDATE PACIENTE SET SEXO = 'M' WHERE COD_PACIENTE = 1;
UPDATE PACIENTE SET SEXO = 'M' WHERE COD_PACIENTE = 3;
UPDATE PACIENTE SET SEXO = 'M' WHERE COD_PACIENTE = 4;
UPDATE PACIENTE SET SEXO = 'F' WHERE COD_PACIENTE = 5;
UPDATE PACIENTE SET SEXO = 'M' WHERE COD_PACIENTE = 6;
UPDATE PACIENTE SET SEXO = 'M' WHERE COD_PACIENTE = 7;
UPDATE PACIENTE SET SEXO = 'F' WHERE COD_PACIENTE = 8;
UPDATE PACIENTE SET SEXO = 'F' WHERE COD_PACIENTE = 9;
UPDATE PACIENTE SET SEXO = 'M' WHERE COD_PACIENTE = 10;