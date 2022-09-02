# Analises preliminares

## Entender quais informações o conjunto de dados possui
O banco de dados é composto por 4 tabelas [descritas aqui](https://github.com/Mirlaa/Challenge-Data-Science-1ed/blob/main/Dados/README.md), onde temos acesso:

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

### dados_mutuarios
| Nome_da_coluna             | tipo_de_dados |
|----------------------------|---------------|
| person_age                 | int           |
| person_emp_length          | double        |
| person_home_ownership      | varchar       |
| person_id                  | varchar       |
| person_income              | int           |

### Emprestimo
| Nome_da_coluna             | tipo_de_dados |
|----------------------------|---------------|
| loan_amnt                  | int           |
| loan_grade                 | varchar       |
| loan_id                    | varchar       |
| loan_int_rate              | double        |
| loan_intent                | varchar       |
| loan_percent_income        | double        |
| loan_status                | int           |


### Histórico banco
| Nome_da_coluna             | tipo_de_dados |
|----------------------------|---------------|
| cb_id                      | varchar       |
| cb_person_cred_hist_length | int           |
| cb_person_default_on_file  | varchar       |


### id

| Nome_da_coluna             | tipo_de_dados |
|----------------------------|---------------|
| cb_id                      | text          |
| loan_id                    | text          |
| person_id                  | text          |

## Verificar quais são as inconsistências nos dados

### dados_mutuarios 
* Numero total de clientes

| numero_total_clientes |
|---|
| 34489 |

* Varificando IDs repitidos;

| person_id | COUNT(*) |
|---|---|
|   | 4 |

* % de vazios ou nulos

| percent_person_id | percent_person_age | percent_person_income | percent_person_home_ownership | percent_person_emp_length |
|---|---|---|---|---|
| 0.0116 | 0.9307 | 0.9742 | 0.9597 | 3.6359 |

### emprestimos 

* Numero total de colunas

| numero_total_emprestimos |
|---|
| 34489 |

* Varificando IDs repitidos;
Número vazio


* % de vazios ou nulos

| percent_loan_id | percent_loan_intent | percent_loan_grade | percent_loan_int_rate | percent_loan_status | percent_loan_percent_income |
|---|---|---|---|---|---|
| 0.0000 | 0.9046 | 0.8988 | 10.5164 | 0.9945 | 0.9162 |

### historico_banco 

* Numero total de colunas

| numero_total_historicos |
|---|
| 34489 |

* Varificando IDs repitidos;
Número vazio

* % de vazios ou nulos

| percent_cb_id_nulos| percent_cb_person_default_on_file_nulos| percent_cb_person_cred_hist_length_nulos|
|---|---|---|
| 0.0000 | 1.0641 | 0.0029 |

### id

| numero_total_de_relacionamentos |
|---|
| 14952 |

* Varificando IDs repitidos;
Número vazio

* numero de vazios

| cb_id_nulos_e_vazios | person_id_default_on_file_nulos_e_vazios | loan_id_nulos_e_vazios |
|---|---|---|
| 0 | 0 | 0 |

# Tratamento dos dados

* Nas colunas de texto alterar os valores nulos para ''
    * dados_mutuarios: person_home_ownership, person_id;
    * historicos_banco: cb_person_default_on_file;

* Nas colunas numéricas foram deixadas em Null para serem tradadas posteriormente 

* Removida as 4 colunas vazias da tabela dados_mutuarios

# Unir as tabelas de acordo com os IDs traduzir os dados e exportar para CSV
O arquivo exportado pode ser encontrado em [dados.csv]