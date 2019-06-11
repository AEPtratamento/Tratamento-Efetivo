/*9.3 Letra A*/

SELECT * FROM MEDICO WHERE cod_medico = 21 AND cod_estado = 27;
SELECT nome_paciente FROM PACIENTE WHERE peso = 60 OR altura = 1.80;
SELECT cod_paciente FROM TRATAMENTO WHERE fim_trat IS NOT NULL;
SELECT cod_bairro FROM BAIRRO WHERE cod_cidade = 1 AND bairro = 'Jardim da Penha';
SELECT cod_tratamento,cod_medico,ini_trat FROM TRATAMENTO WHERE cod_paciente =3 OR cod_indisposicao = 10;

/*Letra B */

SELECT * FROM PACIENTE WHERE cod_end > 40;
SELECT bairro FROM BAIRRO WHERE cod_bairro < 50;
SELECT medicamento FROM CAD_MEDICAMENTO WHERE cod_medicamento = 5;
SELECT hospital FROM HOSPITAL WHERE cod_hospital > 77;



/*Letra C*/

ALTER TABLE PACIENTE RENAME nome_paciente TO nome_do_paciente;
ALTER TABLE TRATAMENTO RENAME cod_tratamento TO cod_trat;
ALTER TABLE MEDICO RENAME nome_medico TO medico;
ALTER TABLE MEDICO RENAME crm TO crm_medico;