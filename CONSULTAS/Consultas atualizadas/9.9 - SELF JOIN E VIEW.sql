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