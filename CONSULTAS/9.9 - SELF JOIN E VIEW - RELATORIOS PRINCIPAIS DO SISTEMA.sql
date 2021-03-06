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
