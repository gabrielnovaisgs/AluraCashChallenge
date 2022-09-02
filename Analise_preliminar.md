# Analises preliminares

## Entender quais informações o conjunto de dados possui
O banco de dados é composto por 4 tabelas [descritas aqui](https://github.com/Mirlaa/Challenge-Data-Science-1ed/blob/main/Dados/README.md), onde temos acesso:

```sql 
SHOW TABLES;
```

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

```sql 
SELECT COLUMN_NAME AS Nome_da_coluna, DATA_TYPE AS tipo_de_dados FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'analise_risco' AND TABLE_NAME = 'dados_mutuarios';
```

| Nome_da_coluna             | tipo_de_dados |
|----------------------------|---------------|
| person_age                 | int           |
| person_emp_length          | double        |
| person_home_ownership      | varchar       |
| person_id                  | varchar       |
| person_income              | int           |

```sql
SELECT COLUMN_NAME AS Nome_da_coluna, DATA_TYPE AS tipo_de_dados FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'analise_risco' AND TABLE_NAME = 'emprestimos';
```

| Nome_da_coluna             | tipo_de_dados |
|----------------------------|---------------|
| loan_amnt                  | int           |
| loan_grade                 | varchar       |
| loan_id                    | varchar       |
| loan_int_rate              | double        |
| loan_intent                | varchar       |
| loan_percent_income        | double        |
| loan_status                | int           |

```sql
SELECT COLUMN_NAME AS Nome_da_coluna, DATA_TYPE AS tipo_de_dados FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'analise_risco' AND TABLE_NAME = 'historicos_banco';
```

| Nome_da_coluna             | tipo_de_dados |
|----------------------------|---------------|
| cb_id                      | varchar       |
| cb_person_cred_hist_length | int           |
| cb_person_default_on_file  | varchar       |

```sql
SELECT COLUMN_NAME AS Nome_da_coluna, DATA_TYPE AS tipo_de_dados FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'analise_risco' AND TABLE_NAME = 'id';
```

| Nome_da_coluna             | tipo_de_dados |
|----------------------------|---------------|
| cb_id                      | text          |
| loan_id                    | text          |
| person_id                  | text          |

## Verificar quais são as inconsistências nos dados

### dados_mutuarios 
* Numero total de clientes
```sql
SET @total_de_clientes := (SELECT COUNT(*) FROM dados_mutuarios);
SELECT @total_de_clientes as numero_total_clientes;
```
| numero_total_clientes |
|---|
| 34489 |

* Numero de vazios ou nulos

```sql
 SELECT 
    SUM(ISNULL(person_id) +IF(person_id LIKE '', 1, 0) ) as person_id_nulos_e_vazios,
    SUM(ISNULL(person_age) +IF(person_age LIKE '', 1, 0) ) as person_age_nulos_e_vazios,
    SUM(ISNULL(person_income) +IF(person_income LIKE '', 1, 0) ) as person_income_nulos_e_vazios,
    SUM(ISNULL(person_home_ownership) +IF(person_home_ownership LIKE '', 1, 0) ) as  person_home_ownership_nulos_e_vazios,
    SUM(ISNULL(person_emp_length) +IF(person_emp_length LIKE '', 1, 0) ) as person_emp_length_nulos_e_vazios
FROM dados_mutuarios;
```

| person_id_nulos_e_vazios | person_age_nulos_e_vazios | person_income_nulos_e_vazios |person_home_ownership_nulos_e_vazios | person_emp_length_nulos_e_vazios |
|---|---|---|---|---|
| 4 | 321 | 336 | 331 | 1254 |


* % de vazios ou nulos
```sql
 SELECT
    (SUM(ISNULL(person_id) +IF(person_id LIKE '', 1, 0)) / @total_de_clientes ) * 100 as percent_person_id,
    (SUM(ISNULL(person_age) +IF(person_age LIKE '', 1, 0)) / @total_de_clientes ) * 100 as percent_person_age,
    (SUM(ISNULL(person_income) +IF(person_income LIKE '', 1, 0)) / @total_de_clientes ) * 100 as percent_person_income,
    (SUM(ISNULL(person_home_ownership) +IF(person_home_ownership LIKE '', 1, 0)) / @total_de_clientes ) * 100 as percent_person_home_ownership,
    (SUM(ISNULL(person_emp_length) +IF(person_emp_length LIKE '', 1, 0)) / @total_de_clientes ) * 100 as percent_person_emp_length
FROM dados_mutuarios;
```
| percent_person_id | percent_person_age | percent_person_income | percent_person_home_ownership | percent_person_emp_length |
|---|---|---|---|---|
| 0.0116 | 0.9307 | 0.9742 | 0.9597 | 3.6359 |


### emprestimos 

* Numero total de colunas

```sql
SET @total_de_emprestimos := (SELECT COUNT(*) FROM emprestimos);
SELECT @total_de_emprestimos as numero_total_emprestimos;
```
| numero_total_emprestimos |
|---|
| 34489 |


* Numero de vazios ou nulos
``` sql
SELECT 
SUM(ISNULL(loan_id) +IF(loan_id LIKE '', 1, 0) ) as loan_id_nulos_e_vazios,
SUM(ISNULL(loan_intent) +IF(loan_intent LIKE '', 1, 0) ) as loan_intent_nulos_e_vazios,
SUM(ISNULL(loan_grade) +IF(loan_grade LIKE '', 1, 0) ) as loan_grade_nulos_e_vazios,
SUM(ISNULL(loan_int_rate) +IF(loan_int_rate LIKE '', 1, 0) ) as loan_int_rate_nulos_e_vazios,
SUM(ISNULL(loan_status) +IF(loan_status LIKE '', 1, 0) ) as loan_status_nulos_e_vazios,
SUM(ISNULL(loan_percent_income) +IF(loan_percent_income LIKE '', 1, 0) ) as loan_percent_income_nulos_e_vazios
FROM emprestimos;
```

| loan_id_nulos_e_vazios | loan_intent_nulos_e_vazios | loan_grade_nulos_e_vazios | loan_int_rate_nulos_e_vazios | loan_status_nulos_e_vazios | loan_percent_income_nulos_e_vazios |
|---|---|---|---|---|---|
| 0 | 312 | 310 | 3627 | 343 | 316 |

* % de vazios ou nulos
``` sql
SELECT 
(SUM(ISNULL(loan_id) +IF(loan_id LIKE '', 1, 0) )/ @total_de_emprestimos )*100 as percent_loan_id,
(SUM(ISNULL(loan_intent) +IF(loan_intent LIKE '', 1, 0) )/ @total_de_emprestimos )*100 as percent_loan_intent,
(SUM(ISNULL(loan_grade) +IF(loan_grade LIKE '', 1, 0) )/ @total_de_emprestimos )*100 as percent_loan_grade,
(SUM(ISNULL(loan_int_rate) +IF(loan_int_rate LIKE '', 1, 0) )/ @total_de_emprestimos )*100 as percent_loan_int_rate,
(SUM(ISNULL(loan_status) +IF(loan_status LIKE '', 1, 0) )/ @total_de_emprestimos )*100 as percent_loan_status,
(SUM(ISNULL(loan_percent_income) +IF(loan_percent_income LIKE '', 1, 0) )/ @total_de_emprestimos )*100 as percent_loan_percent_income
FROM emprestimos;
```

| percent_loan_id | percent_loan_intent | percent_loan_grade | percent_loan_int_rate | percent_loan_status | percent_loan_percent_income |
|---|---|---|---|---|---|
| 0.0000 | 0.9046 | 0.8988 | 10.5164 | 0.9945 | 0.9162 |

### historico_banco 

* Numero total de colunas

```sql
SET @total_de_historicos := (SELECT COUNT(*) FROM historicos_banco);
SELECT @total_de_historicos as numero_total_historicos;
```
| numero_total_historicos |
|---|
| 34489 |

, , 
* Numero de vazios ou nulos
``` sql
SELECT 
SUM(ISNULL(cb_id) +IF(cb_id LIKE '', 1, 0) ) as cb_id_nulos_e_vazios,
SUM(ISNULL(cb_person_default_on_file) +IF(cb_person_default_on_file LIKE '', 1, 0) ) as cb_person_default_on_file_nulos_e_vazios,
SUM(ISNULL(cb_person_cred_hist_length) +IF(cb_person_cred_hist_length LIKE '', 1, 0) ) as cb_person_cred_hist_length_nulos_e_vazios
 FROM historicos_banco;
```

| cb_id_nulos_e_vazios | cb_person_default_on_file_nulos_e_vazios | cb_person_cred_hist_length_nulos_e_vazios |
|---|---|---|
| 0 | 367 | 1 |



* % de vazios ou nulos

``` sql
SELECT 
(SUM(ISNULL(cb_id) +IF(cb_id LIKE '', 1, 0) ) / @total_de_historicos)*100 as percent_cb_id,
(SUM(ISNULL(cb_person_default_on_file) +IF(cb_person_default_on_file LIKE '', 1, 0) ) / @total_de_historicos)*100 as percent_cb_person_default_on_file,
(SUM(ISNULL(cb_person_cred_hist_length) +IF(cb_person_cred_hist_length LIKE '', 1, 0) ) / @total_de_historicos)*100 as percent_cb_person_cred_hist_length
 FROM historicos_banco;
```
| percent_cb_id_nulos| percent_cb_person_default_on_file_nulos| percent_cb_person_cred_hist_length_nulos|
|---|---|---|
| 0.0000 | 1.0641 | 0.0029 |

### id
``` sql
SET @total_de_relacionamentos := (SELECT COUNT(*) FROM id);
SELECT @total_de_relacionamentos as numero_total_de_relacionamentos;
```
| numero_total_de_relacionamentos |
|---|
| 14952 |

```sql
SELECT 
SUM(ISNULL(cb_id) +IF(cb_id LIKE '', 1, 0) ) as cb_id_nulos_e_vazios,
SUM(ISNULL(person_id) +IF(person_id LIKE '', 1, 0) ) as person_id_default_on_file_nulos_e_vazios,
SUM(ISNULL(loan_id) +IF(loan_id LIKE '', 1, 0) ) as loan_id_nulos_e_vazios
 FROM id;
```

| cb_id_nulos_e_vazios | person_id_default_on_file_nulos_e_vazios | loan_id_nulos_e_vazios |
|---|---|---|
| 0 | 0 | 0 |