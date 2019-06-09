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