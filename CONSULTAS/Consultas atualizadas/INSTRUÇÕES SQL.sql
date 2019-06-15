SELECT MED.NOME_MEDICO,CD_ESPEC.ESPECIALIDADE FROM MEDICO MED 
INNER JOIN ESPECIALIDADE ESPEC ON (MED.COD_MEDICO = ESPEC.COD_MEDICO)
INNER JOIN CAD_ESPECIALIDADE CD_ESPEC ON (ESPEC.COD_ESPECIALIDADE = CD_ESPEC.COD_ESPECIALIDADE);

SELECT PAC.NOME_PACIENTE,ENDE.CEP,RUA.RUA,BAIRRO.BAIRRO,CID.CIDADE,EST.ESTADO FROM PACIENTE PAC
INNER JOIN ENDERECO ENDE ON (PAC.COD_END = ENDE.COD_END) INNER JOIN RUA ON (ENDE.COD_RUA = RUA.COD_RUA)
INNER JOIN BAIRRO ON (RUA.COD_BAIRRO = BAIRRO.COD_BAIRRO) INNER JOIN CIDADE CID ON (BAIRRO.COD_CIDADE = CID.COD_CIDADE)
INNER JOIN ESTADO EST ON (CID.COD_ESTADO = EST.COD_ESTADO);

SELECT TRAT.COD_TRATAMENTO AS "Número do tratamento", PAC.NOME_PACIENTE AS "Paciente", 
(PAC.PESO/(PAC.ALTURA*PAC.ALTURA)) AS "IMC do paciente", DATE_PART('YEAR',(AGE(CURRENT_DATE,DATA_NASCIMENTO))) AS "Idade do paciente",
PAC.DATA_NASCIMENTO, RUA.RUA,BAIRRO.BAIRRO, ENDE.NUM_RESIDENCIA AS "Número da residência", 
ENDE.NUM_COMPLEMENTO AS "Número do complemento", CID.CIDADE, EST.ESTADO, INDISP.INDISPOSICAO AS "Tratamento", 
CD_MED.MEDICAMENTO, MEDICO.NOME_MEDICO AS "Nome do médico", CD_ESPEC.ESPECIALIDADE AS "Especialidade do médico",
TRAT.INI_TRAT AS "Inicio do tratamento", TRAT.FIM_TRAT AS "Fim do tratamento", 
HOSP.HOSPITAL FROM TRATAMENTO TRAT INNER JOIN PACIENTE PAC ON (TRAT.COD_PACIENTE = PAC.COD_PACIENTE)
INNER JOIN ENDERECO ENDE ON (PAC.COD_END = ENDE.COD_END) INNER JOIN RUA ON (ENDE.COD_RUA = RUA.COD_RUA)
INNER JOIN BAIRRO ON (RUA.COD_BAIRRO = BAIRRO.COD_BAIRRO) INNER JOIN CIDADE CID ON (BAIRRO.COD_CIDADE = CID.COD_CIDADE)
INNER JOIN ESTADO EST ON (CID.COD_ESTADO = EST.COD_ESTADO) INNER JOIN INDISPOSICAO INDISP ON (TRAT.COD_INDISPOSICAO = INDISP.COD_INDISPOSICAO)
INNER JOIN MEDICAMENTO MED ON (TRAT.COD_TRATAMENTO = MED.COD_TRATAMENTO) INNER JOIN CAD_MEDICAMENTO CD_MED ON (MED.COD_MEDICAMENTO = CD_MED.COD_MEDICAMENTO)
INNER JOIN MEDICO ON (TRAT.COD_MEDICO = MEDICO.COD_MEDICO) INNER JOIN ESPECIALIDADE ESPEC ON (MEDICO.COD_MEDICO = ESPEC.COD_MEDICO)
INNER JOIN CAD_ESPECIALIDADE CD_ESPEC ON (ESPEC.COD_ESPECIALIDADE = CD_ESPEC.COD_ESPECIALIDADE) INNER JOIN HOSPITAL HOSP ON (TRAT.COD_HOSPITAL = HOSP.COD_HOSPITAL)
GROUP BY PAC.COD_PACIENTE,TRAT.COD_TRATAMENTO,ENDE.COD_END,RUA.COD_RUA,BAIRRO.COD_BAIRRO,CID.COD_CIDADE,EST.COD_ESTADO,
MEDICO.COD_MEDICO,INDISP.COD_INDISPOSICAO,HOSP.COD_HOSPITAL,CD_MED.COD_MEDICAMENTO,CD_ESPEC.COD_ESPECIALIDADE;

delete from paciente where altura < 1.70;
delete from tratamento where fim_trat is null;
delete from cad_especialidade where especialidade like 'N%';
update paciente set peso = 70.5 where altura > 1.70;
update estado set cod_estado = 39 where estado like 'Espirito Santo';
update endereco set num_complemento = 1000 where num_complemento is null;

select * from paciente;
select * from tratamento;
select * from cad_especialidade;
select * from medico;
select * from estado;



select med.nome_medico,count(espec.cod_medico) as "Número de especialidades" from medico med 
inner join especialidade espec on (med.cod_medico = espec.cod_medico) group by med.cod_medico;

select (sum(DATE_PART('YEAR',(AGE(CURRENT_DATE,DATA_NASCIMENTO))))/count(cod_paciente)) 
as "Média da idade dos pacientes" from paciente;

select est.estado, count(cid.cod_cidade) as "Número de cidades por estado" from estado est
inner join cidade cid on (est.cod_estado = cid.cod_estado) group by est.cod_estado;

select count(ende.num_complemento) as "Número de pacientes que não moram em apartamento/predio" from endereco ende;


select cep,count(ende.cep) as "Número de pacientes por CEP" from endereco ende
group by ende.cep;

select count(fim_trat) as "Número de tratamentos finalizados" from tratamento where fim_trat is not null;


select  espec1.*,espec2.* from especialidade espec1 
inner join especialidade espec2 on (espec1.cod_especialidade = espec2.cod_medico);


create view relatorio_trat_andamento as (select pac.nome_paciente,indisp.indisposicao as 
"Tratamento", med.nome_medico, trat.ini_trat,trat.fim_trat,hosp.hospital from tratamento trat
inner join paciente pac on (pac.cod_paciente = trat.cod_paciente) inner join medico med on (trat.cod_medico = med.cod_medico)
inner join indisposicao indisp on (trat.cod_indisposicao = indisp.cod_indisposicao) 
inner join hospital hosp on (trat.cod_hospital = hosp.cod_hospital) where fim_trat is null);

create view relatorio_tratamento_medico as (select med.nome_medico,indisp.indisposicao 
as "Tratamento", trat.ini_trat,trat.fim_trat from tratamento trat
inner join medico med on (trat.cod_medico = med.cod_medico)
inner join indisposicao indisp on (trat.cod_indisposicao = indisp.cod_indisposicao));

create view relatorio_tratamento_por_hospital as (select hosp.hospital,indisp.indisposicao 
as "Tratamento", trat.ini_trat from tratamento trat
inner join hospital hosp on (trat.cod_hospital = hosp.cod_hospital)
inner join indisposicao indisp on (trat.cod_indisposicao = indisp.cod_indisposicao)
where fim_trat is null);

create view relatorio_tratamento_finalizado_hospital as (select hosp.hospital,indisp.indisposicao 
as "Tratamento", trat.ini_trat,trat.fim_trat from tratamento trat
inner join hospital hosp on (trat.cod_hospital = hosp.cod_hospital)
inner join indisposicao indisp on (trat.cod_indisposicao = indisp.cod_indisposicao)
where fim_trat is not null);

create view relatorio_duracao_tratamento as (select pac.nome_paciente,indisp.indisposicao as 
"Tratamento", trat.ini_trat,trat.fim_trat, age(fim_trat,ini_trat) as "Duração do tratamento" 
from tratamento trat inner join paciente pac on (pac.cod_paciente = trat.cod_paciente)
inner join indisposicao indisp on (trat.cod_indisposicao = indisp.cod_indisposicao) 
where fim_trat is not null);



create view relatorio_quant_tratamento as (select indisp.indisposicao as 
"Tratamento",count(trat.cod_tratamento) as qtde_tratamento from tratamento trat
inner join indisposicao indisp on (trat.cod_indisposicao = indisp.cod_indisposicao) 
where fim_trat is null group by indisp.indisposicao);

create view relatorio_num_tratamento_hospital as (select hosp.hospital as hospital,count(trat.cod_hospital) as 
quantidade_de_tratamentos_realizado_pelo_hospital from tratamento trat
inner join hospital hosp on (trat.cod_hospital = hosp.cod_hospital) 
where fim_trat is not null group by hosp.cod_hospital);


create view relatorio_trat_finalizado_hospital as (select hosp.hospital as hospital,count(trat.cod_hospital) as 
quantidade_de_tratamentos_realizado_pelo_hospital from tratamento trat
inner join hospital hosp on (trat.cod_hospital = hosp.cod_hospital) 
where fim_trat is not null group by hosp.cod_hospital);

create view relatorio_media_tratamento as (select "Tratamento",avg("Duração do tratamento") as "Media de duração" from (select pac.nome_paciente,indisp.indisposicao as 
"Tratamento", trat.ini_trat,trat.fim_trat, age(fim_trat,ini_trat) as "Duração do tratamento" 
from tratamento trat inner join paciente pac on (pac.cod_paciente = trat.cod_paciente)
inner join indisposicao indisp on (trat.cod_indisposicao = indisp.cod_indisposicao) 
where fim_trat is not null) as teste
group by "Tratamento");


create view relatorio_pessoas_medicamento_por_trat as (select indisp.indisposicao as tratamento,count(trat.cod_indisposicao) as qtde_pessoas, 
count(med.cod_tratamento) as qtde_medicamento from tratamento trat
inner join paciente pac on (trat.cod_paciente = pac.cod_paciente) 
inner join indisposicao indisp on (trat.cod_indisposicao = indisp.cod_indisposicao)
inner join medicamento med on (trat.cod_tratamento = med.cod_tratamento)
group by trat.cod_paciente,med.cod_tratamento,indisp.cod_indisposicao);






select * from cad_especialidade cd_espec
where cd_espec.cod_especialidade in (select especialidade.cod_especialidade from especialidade);

select * from tratamento trat inner join medicamento med on (trat.cod_tratamento = med.cod_tratamento)
where med.cod_medicamento in (select cad_medicamento.cod_medicamento from cad_medicamento) and fim_trat is not null;

select med.nome_medico from medico med where med.cod_medico in (select tratamento.cod_medico from tratamento);


select pac.nome_paciente,indisp.indisposicao as 
"Tratamento", med.nome_medico, trat.ini_trat,trat.fim_trat,hosp.hospital from tratamento trat
inner join paciente pac on (pac.cod_paciente = trat.cod_paciente) inner join medico med on (trat.cod_medico = med.cod_medico)
inner join indisposicao indisp on (trat.cod_indisposicao = indisp.cod_indisposicao) 
inner join hospital hosp on (trat.cod_hospital = hosp.cod_hospital) where fim_trat is null


select hosp.hospital,indisp.indisposicao 
as "Tratamento", trat.ini_trat,trat.fim_trat from tratamento trat
inner join hospital hosp on (trat.cod_hospital = hosp.cod_hospital)
inner join indisposicao indisp on (trat.cod_indisposicao = indisp.cod_indisposicao)
where fim_trat is not null