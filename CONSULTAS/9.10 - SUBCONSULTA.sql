select * from cad_especialidade cd_espec
where cd_espec.cod_especialidade in (select especialidade.cod_especialidade from especialidade);

select * from tratamento trat inner join medicamento med on (trat.cod_tratamento = med.cod_tratamento)
where med.cod_medicamento in (select cad_medicamento.cod_medicamento from cad_medicamento) and fim_trat is not null;

select med.nome_medico from medico med where med.cod_medico in (select tratamento.cod_medico from tratamento);