# Analises preliminares

## Entender quais informações o conjunto de dados possui
O banco de dados é composto por 4 tabelas [descritas aqui](https://github.com/Mirlaa/Challenge-Data-Science-1ed/blob/main/Dados/README.md), onde temos acesso:
 

* aos dados dos clientes
* informações dos empréstimos solicitados
* histórico de empréstimo de cada cliente
* uma tabela que relaciona cada o histórico do cliente, dados do cliente e as informações do empréstimo solicitado

## Analisar quais os tipos de dados
Pegando informações através dos metadados do information_schema

`SELECT COLUMN_NAME AS Nome_da_coluna, DATA_TYPE AS tipo_de_dados FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'analise_risco';`

|----------------------------|---------------|
| Nome_da_coluna             | tipo_de_dados |
|----------------------------|---------------|
| person_age                 | int           |
| person_emp_length          | double        |
| person_home_ownership      | varchar       |
| person_id                  | varchar       |
| person_income              | int           |
| loan_amnt                  | int           |
| loan_grade                 | varchar       |
| loan_id                    | varchar       |
| loan_int_rate              | double        |
| loan_intent                | varchar       |
| loan_percent_income        | double        |
| loan_status                | int           |
| cb_id                      | varchar       |
| cb_person_cred_hist_length | int           |
| cb_person_default_on_file  | varchar       |
| cb_id                      | text          |
| loan_id                    | text          |
| person_id                  | text          |
|----------------------------|---------------|



