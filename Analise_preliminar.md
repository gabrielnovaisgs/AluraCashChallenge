# Analises preliminares

## Entender quais informações o conjunto de dados possui
O banco de dados é composto por 4 tabelas [descritas aqui](https://github.com/Mirlaa/Challenge-Data-Science-1ed/blob/main/Dados/README.md), onde temos acesso:
 
`SHOW TABLES;`

| Tables_in_analise_risco |
|-------------------------|
| dados_mutuarios         |
| emprestimos             |
| historicos_banco        |
| id                      |


* **dados_mutuarios**: dados dos clientes
* **emprestimos**: informações dos empréstimos solicitados
* **historicos_banco**: histórico de empréstimo de cada cliente
* **id**: tabela que relaciona cada o histórico do cliente, dados do cliente e as informações do empréstimo solicitado

## Analisar quais os tipos de dados
Pegando informações através dos metadados do information_schema

`SELECT COLUMN_NAME AS Nome_da_coluna, DATA_TYPE AS tipo_de_dados FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'analise_risco' AND TABLE_NAME = 'dados_mutuarios';`

| Nome_da_coluna             | tipo_de_dados |
|----------------------------|---------------|
| person_age                 | int           |
| person_emp_length          | double        |
| person_home_ownership      | varchar       |
| person_id                  | varchar       |
| person_income              | int           |

`SELECT COLUMN_NAME AS Nome_da_coluna, DATA_TYPE AS tipo_de_dados FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'analise_risco' AND TABLE_NAME = 'emprestimos';`

| Nome_da_coluna             | tipo_de_dados |
|----------------------------|---------------|
| loan_amnt                  | int           |
| loan_grade                 | varchar       |
| loan_id                    | varchar       |
| loan_int_rate              | double        |
| loan_intent                | varchar       |
| loan_percent_income        | double        |
| loan_status                | int           |

`SELECT COLUMN_NAME AS Nome_da_coluna, DATA_TYPE AS tipo_de_dados FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'analise_risco' AND TABLE_NAME = 'historicos_banco';`

| Nome_da_coluna             | tipo_de_dados |
|----------------------------|---------------|
| cb_id                      | varchar       |
| cb_person_cred_hist_length | int           |
| cb_person_default_on_file  | varchar       |


`SELECT COLUMN_NAME AS Nome_da_coluna, DATA_TYPE AS tipo_de_dados FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'analise_risco' AND TABLE_NAME = 'id';`

| Nome_da_coluna             | tipo_de_dados |
|----------------------------|---------------|
| cb_id                      | text          |
| loan_id                    | text          |
| person_id                  | text          |




