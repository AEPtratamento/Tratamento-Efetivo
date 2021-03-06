# TRABALHO 01: Tratamento Efetivo
Trabalho desenvolvido durante a disciplina de BD1

# Sumário

## 1. COMPONENTES<br>
Integrantes do grupo<br>
Ana Carolina: carolichimura24@gmail.com<br>
Pedro Henrique Moura: phcontas@hotmail.com<br>
Emanuel Medeiros: market_live@outlook.com<br>


## 2.INTRODUÇÃO E MOTIVAÇAO<br>
>O sistema "Tratamento Efetivo" é centrado em ofececer meios para melhorar a vida de pessoas que precisam utilizar o sistema de saúde. Apesar dos constantes avanços que a ciência obtem na área da saúde, diversos serviços prestados e oferecidos por hospitais continuam sendo realizados de modo manual.
Baseado na necessidade de automatizar alguns serviços de saúde, o sistema terá como objetivo fornecer dados e informações que auxilie os pacientes a obterem informações de tratamentos e exames que estão sendo realizados ou que foram finalizados. Assim como os pacientes, os médicos poderão visualizar também os tratamentos em que ele faz parte. Para que o sistema funcione de forma adequada é preciso permitir o registro de pacientes, médicos, exames, hospitais, medicamentos e doenças, tais informações são fundamentais para completar os dados de um tratamento que será vinculado no sistema.  O sistema deverá gerar relatórios de modo que mostre informações geradas no sistema de forma didática.

## 3.MINI-MUNDO <br>

> O sistema “Tratamento Efetivo” terá como usuários principais os pacientes e médicos. Será fornecido a esses usuários a possibilidade de registro no sistema. O paciente terá o seu nome, sexo, peso, altura, data de nascimento, cpf e endereço registrado no sistema, enquanto do médico será registrado o CRM, estado pertencente, nome e especialidade(s). O tramento a ser iniciado terá a sua identificação própria dentro do sistema, e cada tratamento deve conter o paciente especificado, o médico responsável pelo tratamento, a doença a ser tratada, os medicamentos a serem usados, a data de inicio e fim do tratamento e em qual hospital estará ocorrendo o processo ou que foi finalizado. É importante lembrar que o sistema deve tratar o fato do médico ter uma ou mais especialidades, assim como um tratamento pode ter mais de um medicamento sendo usado nele. O sistema deve saber o nome da rua que o paciente mora e em qual bairro ela está localizada, e por consequência de qual estado e cidade esse bairro faz parte.

## 4.RASCUNHOS BÁSICOS DA INTERFACE (MOCKUPS)<br>

![Arquivo PDF do Protótipo Balsamiq feito para o Sistema Tratamento Efetivo](https://github.com/Pedro-Henrique-Moura/Tratamento-Efetivo/blob/master/Telas%20projeto%20BD1%20v3.0.pdf)

### 4.1 QUAIS PERGUNTAS PODEM SER RESPONDIDAS COM O SISTEMA PROPOSTO?
    
> O Sistema Tratamento Efetivo precisa inicialmente dos seguintes relatórios:
* Relatório que informa a quantidade de pessoas realizando um determinado tipo de tratamento.
* Relatório que retorna a incidência de uma doença em um determinado estado.
* Relatório que mostre os hospitais que possui tratamentos concluidos, quantificando quantos tratamentos foram concluidos.
* Relatório contendo a média de duração do tratamentos das indisposições/doenças que possuem registro nos tratamentos finalizados.
* Relatório que retorna o número de medicamentos usado por uma pessoa em cada tratamento que ela finalizou ou está fazendo.
* Relatório contendo quantos tratamentos foram finalizados em cada hospital, separando por tipo de doença tratada.
 
 
### 4.2 TABELA DE DADOS DO SISTEMA:

https://github.com/Ana-Ichimura/Tratamento-Efetivo/blob/master/Tabela%20de%20dados.xlsx


## 5.MODELO CONCEITUAL<br> 
        
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/Modelo_Conceitual_tratamento_efetivo.png)
    
### 5.1 Validação do Modelo Conceitual
    Lixeira Inteligente: Jackson William, Lavinia Corteletti, Thiago Moreira,Vinicius Freitas 
    Lista de Compras Online: Matheus Garcias, Letícia Teixeira, Júlia Miranda, Henrique Bastos

### 5.2 DECISÕES DE PROJETO

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
     
     
   ### 5.3 DESCRIÇÃO DOS DADOS (Descrição das tabelas e dos campos, das tabelas, considerados de difícil compreensão)
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
        
## 6	MODELO LÓGICO<br>

![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/L%C3%B3gico_tratamento_efetivo.png)

## 7	MODELO FÍSICO

Link modelo físico: https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/7%20-%20(ATUALIZADO)%20MODELO%20F%C3%8DSICO.sql
    

## 8	INSERT APLICADO NAS TABELAS DO BANCO DE DADOS

### 8.1 DETALHAMENTO DAS INFORMAÇÕES 

Link inserção de dados: https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/Consultas%20atualizadas/8.1%20-%20DETALHAMENTO%20DAS%20INFORMA%C3%87%C3%95ES.sql

### 8.2 INCLUSÃO DO SCRIPT PARA CRIAÇÃO DE TABELAS E INSERÇÃO DOS DADOS

Link dos scripts agrupados:
https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/Consultas%20atualizadas/8.2%20-%20(ATUALIZADO)%20INCLUS%C3%83O%20DO%20SCRIPT%20PARA%20CRIA%C3%87%C3%83O%20DE%20TABELAS%20E%20INSER%C3%87%C3%83O%20DOS%20DADOS.sql

Backup: https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/BACKUP%20TRATAMENTO%20EFETIVO/bkp_tratamento_efeitivo_20190615.backup

Backup base de dados usado para gerar os dados do relatório da apresentação em sala de aula: https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/BACKUP%20TRATAMENTO%20EFETIVO/bkp_tratamento_efetivo_20190618_apresentacao.backup

Obs: Como a tabela tratamento foi a principal para gerar os relatórios, a inserção de informações novas ocorreu principalmente nela, no entanto o primeiro backup apresentado possui uma base de dados mais fiel ao sistema, porém há menos informações.

### 8.3 INCLUSÃO DO SCRIPT PARA EXCLUSÃO DE TABELAS EXISTENTES, CRIAÇÃO DE TABELA NOVAS E INSERÇÃO DOS DADOS

Link com a junção dos scripts, remoção de chave estrangeira, drop das tabelas e do backup para resturação: https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/Consultas%20atualizadas/8.3%20-%20(ATUALIZADO)%20INCLUS%C3%83O%20DO%20SCRIPT%20PARA%20EXCLUS%C3%83O%20DE%20TABELAS%20EXISTENTES%2C%20CRIA%C3%87%C3%83O%20DE%20TABELA%20NOVAS%20E%20INSER%C3%87%C3%83O%20DOS%20DADOS.sql

backup: https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/BACKUP%20TRATAMENTO%20EFETIVO/bkp_tratamento_efeitivo_20190615.backup

Backup base de dados usado para gerar os dados do relatório da apresentação em sala de aula: https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/BACKUP%20TRATAMENTO%20EFETIVO/bkp_tratamento_efetivo_20190618_apresentacao.backup

Obs: Como a tabela tratamento foi a principal para gerar os relatórios, a inserção de informações novas ocorreu principalmente nela, no entanto o primeiro backup apresentado possui uma base de dados mais fiel ao sistema, porém há menos informações.

### 8.4 Principais fluxos de informação e principais tabelas do sistema

a) Os principais fluxos de dados de informação são:

1 - Pacientes em tratamento,uma vez que o sistema tem foco nos usuários de hospitais e seus tratamentos.

2 - Endereço que o paciente mora, tendo em vista que há diversos relacionamentos na criação do endereço do paciente.

3 -  Na tabela de tratamento apartir de um código obtemos todas as informações sobre o tratamento de um paciente no sistema.

b) As tabelas que conterão mais dados no nosso sistema são:

1 - Paciente
3 - Endereço
4 - Tratamento

c) As 5 principais tabelas do sistema são:

1 - Paciente
2 - Medico
3 - Endereco
4 - Tratamento
5 - Indisposicao


### 9	TABELAS E PRINCIPAIS CONSULTAS

## 9.1 - 
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/Selects.PNG)

Link imagens GIT: https://github.com/AEPtratamento/Tratamento-Efetivo/tree/master/CONSULTAS/imagens%20consultas/9.1

## 9.2 -
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/Slects2.PNG)

Link imagens GIT: https://github.com/AEPtratamento/Tratamento-Efetivo/tree/master/CONSULTAS/imagens%20consultas/9.2

## 9.3 - 
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/Selects3.PNG)

Link imagens GIT: https://github.com/AEPtratamento/Tratamento-Efetivo/tree/master/CONSULTAS/imagens%20consultas/9.3

## 9.4 -
Link Consultas: https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/9.4%20-%20CONSULTAS%20QUE%20USAM%20OPERADORES%20LIKE%20E%20DATAS.sql

Link imagens GIT: https://github.com/AEPtratamento/Tratamento-Efetivo/tree/master/CONSULTAS/imagens%20consultas/9.4

## 9.5 - UPDATE E DELETE

Link GIT com as instruções SQL: https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/9.5%20-%20UPDATE%20E%20DELETE.sql

![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.5/1.2.png)

![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.5/2.2.png)

![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.5/2.3.png)

![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.5/3.2.png)

![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.5/4.2.png)

![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.5/5.2.png)


## 9.6 - CONSULTAS COM JUNÇÃO E ORDENAÇÃO

a) Link GIT com a instrução SQL: https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/9.6%20-%20JUN%C3%87%C3%83O%20COM%20TODAS%20TABELAS.sql

![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.6/1%20-%20Correcao.png)
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.6/2.png)
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.6/3.png)

b)
Consulta com informações do Tratamento do Paciente:
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/Join%201.PNG)
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/TabelaJoin%201.PNG)


Consulta com as informações da localidade do Paciente:
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/Join2.PNG)
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/TabelaJoin2.PNG)


Consulta com as informações do Médico:
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/Join3.PNG)
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/TabelaJoin%203.PNG)

Consulta com as informações do Médico e dos Tratamentos realizados por ele:
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/Join%204.PNG)
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/TabelaJoin%204.PNG)

Consulta com as informações dos pacientes que ainda não finalizaram seu tratamento:
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/join%205.PNG)
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/TabelaJoin%205.PNG)

## 9.7 - CONSULTAS GROUP BY E FUNÇÕES DE AGRUPAMENTO

Link GIT com as intruções SQL: https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/9.7%20-%20GROUP%20BY%20E%20FUN%C3%87%C3%95ES%20DE%20AGRUPAMENTO.sql

Consulta com número de especialidades do médico
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.7/1.png)

Consulta para verificar a idade média dos pacientes
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.7/2.png)

Quantia de cidades por estado que estão registradas no sistema
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.7/3.png)

Consulta para verificar quantos paciente não moram em apartamento/predio
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.7/4.png)

Número de pacientes que possui o CEP em comum
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.7/5.png)

Verificação de número de tratamentos finalizados
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.7/6.png)

## 9.8 - CONSULTAS COM LEFT E RIGHT JOIN

Consulta realizada para saber quais pacientes ainda não possuem tratamento.
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/RightJoin.PNG)
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/TabelaRight.PNG)

Consulta realizada para saber quais médicos não possuem especialidade.
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/LeftJOINimg.PNG)
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/leftJoin.PNG)

## 9.9 - CONSULTAS COM SELF JOIN E VIEW

Link GIT com as instruções SQL: https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/9.9%20-%20SELF%20JOIN%20E%20VIEW.sql

Verificação para ver os médicos que possuem o ID igual ao código da especialidade no banco de dados
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.9/1.png)

View para consultar os tratamentos que estão em andamento
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.9/2.png)

View para consultar os médicos responsáveis de cada tratamento em andamento
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.9/3.png)

View para consultar os tratamentos em andamento dos hospitais, dos que possuem tratamento em andamento
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.9/4.png)

View para ver todos os tratamentos finalizados de acordo com o hospital
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.9/5.png)

View para consultar quantos dias um tratamento durou
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.9/6.png)

## 9.9 - CONSULTAS COM SELF JOIN E VIEW - RELATÓRIOS PRINCIPAIS DO SISTEMA

Link GIT contendo as intruções SQL: https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/9.9%20-(ATUALIZADO)%20%20SELF%20JOIN%20E%20VIEW%20-%20RELATORIOS%20PRINCIPAIS%20DO%20SISTEMA.sql

View para consultar tratamentos em andamentos e a quantia de pacientes realizando esses tratamentos
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.9/11.png)

View para consultar o número de tratamentos finalizados nos hospitais, separando por tipo de tramento
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.9/8.png)

View para consultar o número de tratamentos que foram realizados em cada hospital
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.9/9.png)

View para visualizar a média de duração dos tratamentos
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.9/12.png)

View para consultar a relação do número de medicamentos usado por cada pessoa de acordo com os tratamentos registrados no sistema
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.9/13.png)

## 9.10 - SUBCONSULTAS

Link GIT com as intruções SQL: https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/9.10%20-%20SUBCONSULTA.sql

Subconsulta para verificar todas especialidades que estão vinculadas a um médico no mínimo
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.10/1%20-%20atualizada.png)

Usando subconsulta para consultar os tratamentos finalizados que possuem medicamentos registrados na tabela de cadastro de medicamento
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.10/2%20-%20atualizada.png)

Usando subconsulta para verificar o nome dos médicos que participam ou participaram de algum tratamento
![Alt text](https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/CONSULTAS/imagens%20consultas/9.10/3%20-%20atualizada.png)

## 10 - BACKUP DO BANCO DE DADOS (NA PASTA CONTEM BACKUPS ANTIGOS E ATUALIZADOS)

Backup: https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/BACKUP%20TRATAMENTO%20EFETIVO/bkp_tratamento_efeitivo_20190615.backup

## 11 - INSTRUÇÕES PARA RESTAURAÇÃO 

Instruções a serem seguidas: https://github.com/AEPtratamento/Tratamento-Efetivo/blob/master/BACKUP%20TRATAMENTO%20EFETIVO/read%20me%20-%20atualizado.txt
