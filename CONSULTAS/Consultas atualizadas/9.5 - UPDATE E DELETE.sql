delete from paciente where altura < 1.70;
delete from tratamento where fim_trat is null;
delete from cad_especialidade where especialidade like 'N%';
update paciente set peso = 70.5 where altura > 1.70;
update estado set cod_estado = 39 where estado like 'Espirito Santo';
update endereco set num_complemento = 1000 where num_complemento is null;