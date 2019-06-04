# TRABALHO 01: Tratamento Efetivo
Trabalho desenvolvido durante a disciplina de BD1

# Sumário

### 1. COMPONENTES<br>
Integrantes do grupo<br>
Ana Carolina: carolichimura24@gmail.com<br>
Pedro Henrique: phcontas@hotmail.com<br>
Emanuel Medeiros: market_live@outlook.com<br>


### 2.INTRODUÇÃO E MOTIVAÇAO<br>
>O sistema "Tratamento Efetivo" é centrado em ofececer meios para melhorar a vida de pessoas que precisam utilizar o sistema de saúde. Apesar dos constantes avanços que a ciência obtem na área da saúde, diversos serviços prestados e oferecidos por hospitais continuam sendo realizados de modo manual.
Baseado na necessidade de automatizar alguns serviços de saúde, o sistema terá como objetivo fornecer dados e informações que auxilie os pacientes a obterem informações de tratamentos e exames que estão sendo realizados ou que foram finalizados. Assim como os pacientes, os médicos poderão visualizar também os tratamentos em que ele faz parte. Para que o sistema funcione de forma adequada é preciso permitir o registro de pacientes, médicos, exames, hospitais, medicamentos e doenças, tais informações são fundamentais para completar os dados de um tratamento que será vinculado no sistema.  O sistema deverá gerar relatórios de modo que mostre informações geradas no sistema de forma didática.

### 3.MINI-MUNDO <br>

> O sistema “Tratamento Efetivo” terá como usuários principais os pacientes e médicos. Será fornecido a esses usuários a possibilidade de registro no sistema. O paciente terá o seu nome, peso, altura, data de nascimento, cpf e endereço registrado no sistema, enquanto do médico será registrado o CRM, estado pertencente, nome e especialidade(s). O tramento a ser iniciado terá a sua identificação própria dentro do sistema, e cada tratamento deve conter o paciente especificado, o médico responsável pelo tratamento, a doença a ser tratada, os medicamentos a serem usados, a data de inicio e fim do tratamento e em qual hospital estará ocorrendo o processo. É importante lembrar que o sistema deve tratar o fato do médico ter uma ou mais especialidades, assim como um tratamento pode ter mais de um medicamento sendo usado nele. O sistema deve saber o nome da rua que o paciente mora e em qual bairro ela está localizada, e por consequência de qual estado e cidade esse bairro faz parte.

### 4.RASCUNHOS BÁSICOS DA INTERFACE (MOCKUPS)<br>

![Arquivo PDF do Protótipo Balsamiq feito para o Sistema Tratamento Efetivo](https://github.com/Pedro-Henrique-Moura/Tratamento-Efetivo/blob/master/Telas%20projeto%20BD1%20v3.0.pdf)

#### 4.1 QUAIS PERGUNTAS PODEM SER RESPONDIDAS COM O SISTEMA PROPOSTO?
    
> O Sistema Tratamento Efetivo precisa inicialmente dos seguintes relatórios:
* Relatório que mostre os tratamentos realizados pelo usuário de acordo com o periodo especfiicado por ele. Tal relatório deverá mostrar os tratamentos em andamentos que o paciente está realizando e qual doença está sendo tratada, junto com os médicamentos usados no processo.
* Relatório que informe os respectivos médicos que foram responsáveis por determinados tratamentos, ou seja, será retornada os tratamento que um médico é responsável.
* Relatório que mostre quantos tratamentos está sendo realizado (em andamento) em determinado hospital.
* Relatório que deve estar especificado quais tratamento foram finalizados em determinado hospital.
* Relatório que compara o tempo de duração de cada tratamento de acordo com os registros das etapas no sistema. Com isso a pessoa terá uma noção do tempo gasto em cada tratamento e se for o caso ela poderá otimizar o tempo na próxima vez que for realizar um tratamento parecido.
 
 
#### 4.2 TABELA DE DADOS DO SISTEMA:

https://github.com/Ana-Ichimura/Tratamento-Efetivo/blob/master/Tabela%20de%20dados.xlsx


### 5.MODELO CONCEITUAL<br> 
        
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/Modelo_Conceitual2.png)
    
#### 5.1 Validação do Modelo Conceitual
    Lixeira Inteligente: Jackson William, Lavinia Corteletti, Thiago Moreira,Vinicius Freitas 
    Lista de Compras Online: Matheus Garcias, Letícia Teixeira, Júlia Miranda, Henrique Bastos

#### 5.2 DECISÕES DE PROJETO

    [Tabela TRAMENTO]: [Criação de tabela auxiliar para medicamentos]
    
    a) Campo lista_medicamento: Em vez de criar um campo multivalorado, optamos por criar uma tabela chamada LISTA_MEDICAMENTO que conterá até cinco códigos de medicamentos. Essa lista funcionará como uma tabela auxiliar para a tabela tratamento, já que um tramento pode ter mais de um medicamento sendo usado e por isso vimos a necessidade de criar tal lista.
    
    b) Um campo multivalorado não deixaria as informações legíveis do modo como gostariamos, e mesmo que a criação de uma tabela auxiliar aumente a complexidade do projeto, esse foi um dos únicos meios que encontramos até o momomento de inserior mais de uma informação em um único campo.
    
    [Tabela MEDICO]: [Criação de tabela auxiliar para especialidades]
    
    a) Campo lista_especialidade: Semelhante ao caso citado acima, a tabela LISTA_ESPECIALIDADE contém no máximo três especialidades e foi criada com o intuito de vincular até três tipos de especialidades para um único médico.
    
    b) Prezando pela legibilidade novamente, um campo multivalorado dificultaria a consulta de informações na tabela e a legibilidade delas seria menor.
    
    [Tabela BAIRRO e CIDADE]: [Chave estrangeira para cidade e bairro]
    
    a) Campo cod_estado e cod_cidade: Consultar futuramente a cidade e estado do bairro será mais fácil ao realizar um inner join entre as tabelas ESTADO e CIDADE. Se esses campos não existisse teriamos que fazer uma relação entre quatro tabelas em vez de três. 
    A tabela CIDADE contém o campo cod_estado para facilitar também a consulta de informações no banco de dados, principalmente se for o caso de ver qual o estado de determinadas cidades ou quais cidades pertencem a um determinado estado..
    
    b) Conforme foi dito anteriormente, a consulta para ver a cidade e estado que um bairro pertence torna-se mais simples e ela será indenpendente da tabela endereço, assim como fica mais fácil de saber quais bairros pertecem a um determinado estado ou cidade. 
    Para a tabela cidade é o mesmo caso, a independência da tabela endereço para consultar essas informações torna a consulta mais simples.
    
    [Tabela RUA]: [Chave estrangeira para rua, contendo então o código do bairro,cidade e estado]
    
    a) Campo cod_bairro,cod_cidade e cod_estado: Anteriormente tinhamos optado por colocar o nome da rua diretamente na tabela ENDERECO e o código do bairro, cidade e estado como chave estrangeira na tabela ENDERECO. De modo que simplifique as informações presente na tabela e evite ruas com nomes repetidos, decidimos criar uma tabela chamada RUA e colocar como chave estrangeira o código do bairro, cidade e estado.
    
     b) O número de chaves estrangeiras da tabela ENDERECO será menor, já que usando uma única tabela (RUA) conseguiremos deixar a tabela ENDERECO com três colunas a menos, tendo em vista que as informações relacionadas ao bairro, cidade e estado poderão ser encontradas na tabela rua. Conforme foi dito anteriormente, um dos objetivos é evitar também a repetição do nome da rua na tabela ENDERECO.
     
     
   #### 5.3 DESCRIÇÃO DOS DADOS (Descrição das tabelas e dos campos, das tabelas, considerados de difícil compreensão)
    ESTADO: Tabela que armazena os estados para serem inseridos na tabela endereco, cidade e bairro.
    
    CIDADE: Tabela que armazena os dados das cidades registradas no sistema. Ela terá relação com a tabela enderco e bairro.

    BAIRRO: Tabela que especifica o bairro e em qual estado e cidade o bairro está, já que possui relação com a tabela estado e cidade.

    RUA: Tabela que armazena o nome da rua e o codigo interno do sistema da rua cadastrada. 

    ENDERECO: Tabela que armazena o endereço de um paciente junto com o respectivo código do endereço. Ela terá também a chave estrangeira que especifica a rua desse endereço.
        Campo COD_END: Código do endereço que será usado como chave estrangeira na tabela PACIENTE.
        Campo NUM_RESIDENCIA: Número da casa ou do predio em que o paciente mora.
        Campo NUM_COMPLEMENTO: Caso o paciente more em condomínio, esse campo serve para especificar em qual apartamento o paciente mora.
    
    PACIENTE: Tabela responsável por guardar os dados do paciente.
        COD_PACIENTE: Campo usado como chave primaria para o paciente em vez de colocar o CPF como primary key.
        COD_ENDERECO: Campo para especificar qual é o código do endereço do paciente na tabela endereco.
    
    CAD_ESPECIALIDADE: Tabela que contém o registro das especialidades que podem pertencer aos médicos.

    ESPECIALIDADE: Será possível registrar para o médico até três especialidades, por isso a tabela lista_especialidade será a responsável por armazenar as possíveis especialidades que o médico venha ter.
        COD_LISTA: Campo que registra um código para ser usado como chave estrangeira na tabela medico, de modo que os médicos tenham uma lista de especialidade.
        PRIM_ESPECIALIDADE/SECU_ESPECIALIDADE/TERC_ESPECIALIDADE: Campos que contém o código de no máximo três especialidades distintas para o médico.

    MEDICO: Tabela para armazenar as informações do médicos, tais como o nome, o crm e sua lista de especialidades.

    CAD_MEDICAMENTO: Tabela com o registro dos medicamentos que serão usados nos tratamentos.

    MEDICAMENTO: Como pode ser usado mais de um medicamento em um tratamento, a tabela lista_medicamento serve para armazenar até 5 medicamentos onde serão vinculados depois a tabela tratamento através do um código.
        PRIM_COD/SEGU_COD/TERC_COD/QUART_COD/QUINT_COD: Campos que conterá até cinco códigos de medicamentos.
    
    HOSPITAL: Tabela que contém o registro do hospital o qual o tratamento estará sendo realizado.

    INDISPOSICAO: Tabela usada para armazenar as doenças a serem tratadas, assim como atividades repassadas pelo médico, como fisioterapia.

    TRATAMENTO: Tabela com as informações de um tramento em andamento ou finalizado. Ela armazena também informações como o paciente que está realizando o tratamento e o hospital o qual o processo está sendo feito.
        LISTA_MEDICAMENTO: Campo com o código da lista de medicamento a serem usados no tratamento.
        NUM_CRM: Campo com o código do CRM do médico.
        INICIO_TRAT e FIM_TRAT: Campo com a respectiva data de inicio e fim do tratamento.
        
### 6	MODELO LÓGICO<br>

![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/Modelo_Logico.png)

### 7	MODELO FÍSICO

Link modelo físico: https://drive.google.com/drive/folders/1HNHsZx3BMc_Wu5OZrmySoSfP8RM8vC5K
    


### 8	INSERT APLICADO NAS TABELAS DO BANCO DE DADOS


8.4 - a) Os principais fluxos de dados de informação são:

1-Pacientes em tratamento,uma vez que o sistema tem foco nos usuários de hospitais e seus tratamentos.

2 - Médicos que auxiliam no tratamento dos pacientes,desde a primeira consulta até o fim do tratamento.

3 -  Por fim,temos a tabela de tratamento,na qual apartir de um código obtemos todas as informações sobre o tratamento de um paciente,
visando simplificar e tornar dinâmico o sistema.

b) As tabelas que conterão mais dados no nosso sistema são:

1 - Paciente
2 - Médico
3 - Endereço
4 - Tratamento

c) As 5 principais tabelas do sistema são:

1 - Paciente
2 - Médico
3 - Endereço
4 - Tratamento
5 - Infermidade


### 9	TABELAS E PRINCIPAIS CONSULTAS

9.1 - SELECT * FROM PACIENTE; <br>
SELECT * FROM ENDERECO <br>
SELECT * FROM ESTADO <br>
SELECT * FROM CIDADE <br>
SELECT * FROM BAIRRO <br>
SELECT * FROM INDISPOSICAO <br>
SELECT * FROM MEDICO <br>
SELECT * FROM ESPECIALIDADE <br>
SELECT * FROM HOSPITAL <br>
SELECT * FROM TRATAMENTO <br>
SELECT * FROM MEDICAMENTO <br>
SELECT * FROM RUA <br>
SELECT * FROM CAD_MEDICAMENTO <br>
SELECT * FROM CAD_ESPECIALIDADE <br>

9.2 - <br>
SELECT * FROM MEDICO WHERE cod_listpec = 1;<br>
SELECT nome_paciente,peso,altura FROM PACIENTE WHERE cod_paciente = 4;<br>
SELECT  cod_paciente FROM TRATAMENTO WHERE cod_tratamento  1;<br>
SELECT crm FROM MEDICO WHERE uf = 27;<br>


9.3 - a)<br>
SELECT * FROM MEDICO WHERE cod_listpec = 7 AND uf = 27;<br>
SELECT nome_paciente FROM PACIENTE WHERE  peso = 60 OR altura = 1.80;<br>
SELECT cod_paciente FROM TRATAMENTO WHERE fim_trat IS NOT NULL; <br>
SELECT cod_bairro FROM BAIRRO WHERE cod_estado = 21 AND cod_cidade = 1;<br>
SELECT num_crm FROM TRATAMENTO WHERE uf_medico = 33 OR cod_doenca = 52<br>


b) <br>
SELECT * FROM PACIENTE WHERE cod_endereco > 40;<br>
SELECT nome_bairro FROM BAIRRO WHERE cod_bairro < 50;
SELECT medicamento FROM CAD_MEDICAMENTO WHERE cod_medicamento = 5;<br>
SELECT hospital FROM HOSPITAL WHERE cod_hospital > 100;<br>

c) <br>
ALTER TABLE PACIENTE RENAME nome_paciente TO nome_do_paciente;<br>
ALTER TABLE TRATAMENTO RENAME cod_tratamento TO cod_trat;<br>
ALTER TABLE MEDICO RENAME nome_medico TO medico;<br>
ALTER TABLE MEDICO RENAME uf TO uniao_federativa;<br>


9.4 - a)<br>

SELECT cod_paciente FROM PACIENTE WHERE nome_paciente ILIKE  'P%';<br>
SELECT crm FROM MEDICO WHERE nome_medico LIKE  '%A';<br>
SELECT cod_estado FROM ESTADO WHERE nome_estado ILIKE  'R%';<br>
SELECT nome_bairro FROM BAIRRO WHERE nome_bairro LIKE  'J%';<br>
SELECT * FROM PACIENTE WHERE nome_paciente LIKE '%A%';<br>
SELECT cod_medico FROM MEDICO WHERE nome_medico ILIKE 'c%';<br>
SELECT cod_bairro FROM RUA WHERE nome_rua LIKE 'O%';<br>
SELECT cod_espec FROM TRATAMENTO WHERE nome_especialidade ILIKE '%N';<br>
SELECT cod_medicamento FROM CAD_MEDICAMENTO WHERE medicamento LIKE '%z%'<br>

b)<br> SELECT data_nascimento FROM PACIENTE;<br>
SELECT inicio_trat FROM TRATAMENTO;<br>
SELECT fim_trat FROM TRATAMENTO;<br>




