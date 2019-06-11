/*9.4 - Letra A*/


SELECT cod_paciente,nome_paciente FROM PACIENTE WHERE nome_paciente ILIKE 'P%';
SELECT crm_medico FROM MEDICO WHERE medico LIKE 'A%';
SELECT cod_estado FROM ESTADO WHERE estado ILIKE 'R%';
SELECT bairro FROM BAIRRO WHERE bairro LIKE 'J%';
SELECT * FROM PACIENTE WHERE nome_paciente LIKE '%A%';
SELECT cod_medico FROM MEDICO WHERE medico ILIKE 'c%';
SELECT cod_bairro FROM RUA WHERE rua LIKE 'R%';
SELECT medicamento FROM CAD_MEDICAMENTO WHERE medicamento LIKE '%c%'
SELECT cod_medicamento FROM CAD_MEDICAMENTO WHERE medicamento LIKE '%z%'


/*9.4 - Letra B*/

SELECT data_nascimento FROM PACIENTE;
SELECT ini_trat FROM TRATAMENTO;
SELECT fim_trat FROM TRATAMENTO;