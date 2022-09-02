SHOW TABLES;

SELECT COLUMN_NAME AS Nome_da_coluna, DATA_TYPE AS tipo_de_dados FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'analise_risco' AND TABLE_NAME = 'dados_mutuarios';

SELECT COLUMN_NAME AS Nome_da_coluna, DATA_TYPE AS tipo_de_dados FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'analise_risco' AND TABLE_NAME = 'emprestimos';

SELECT COLUMN_NAME AS Nome_da_coluna, DATA_TYPE AS tipo_de_dados FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'analise_risco' AND TABLE_NAME = 'historicos_banco';

SELECT COLUMN_NAME AS Nome_da_coluna, DATA_TYPE AS tipo_de_dados FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'analise_risco' AND TABLE_NAME = 'id';

### dados_mutuarios 
SET @total_de_clientes := (SELECT COUNT(*) FROM dados_mutuarios);
SELECT @total_de_clientes as numero_total_clientes;
# numero de vazios ou nulos
 SELECT 
    SUM(ISNULL(person_id) +IF(person_id LIKE '', 1, 0) ) as person_id_nulos_e_vazios,
    SUM(ISNULL(person_age) +IF(person_age LIKE '', 1, 0) ) as person_age_nulos_e_vazios,
    SUM(ISNULL(person_income) +IF(person_income LIKE '', 1, 0) ) as person_income_nulos_e_vazios,
    SUM(ISNULL(person_home_ownership) +IF(person_home_ownership LIKE '', 1, 0) ) as  person_home_ownership_nulos_e_vazios,
    SUM(ISNULL(person_emp_length) +IF(person_emp_length LIKE '', 1, 0) ) as person_emp_length_nulos_e_vazios
FROM dados_mutuarios;


#% de vazios ou nulos
 SELECT
    (SUM(ISNULL(person_id) +IF(person_id LIKE '', 1, 0)) / @total_de_clientes ) * 100 as percent_person_id,
    (SUM(ISNULL(person_age) +IF(person_age LIKE '', 1, 0)) / @total_de_clientes ) * 100 as percent_person_age,
    (SUM(ISNULL(person_income) +IF(person_income LIKE '', 1, 0)) / @total_de_clientes ) * 100 as percent_person_income,
    (SUM(ISNULL(person_home_ownership) +IF(person_home_ownership LIKE '', 1, 0)) / @total_de_clientes ) * 100 as percent_person_home_ownership,
    (SUM(ISNULL(person_emp_length) +IF(person_emp_length LIKE '', 1, 0)) / @total_de_clientes ) * 100 as percent_person_emp_length
FROM dados_mutuarios;

### emprestimos 
#Numero total de colunas
SET @total_de_emprestimos := (SELECT COUNT(*) FROM emprestimos);
SELECT @total_de_emprestimos as numero_total_emprestimos;

#* Numero de vazios ou nulos
SELECT 
SUM(ISNULL(loan_id) +IF(loan_id LIKE '', 1, 0) ) as loan_id_nulos_e_vazios,
SUM(ISNULL(loan_intent) +IF(loan_intent LIKE '', 1, 0) ) as loan_intent_nulos_e_vazios,
SUM(ISNULL(loan_grade) +IF(loan_grade LIKE '', 1, 0) ) as loan_grade_nulos_e_vazios,
SUM(ISNULL(loan_int_rate) +IF(loan_int_rate LIKE '', 1, 0) ) as loan_int_rate_nulos_e_vazios,
SUM(ISNULL(loan_status) +IF(loan_status LIKE '', 1, 0) ) as loan_status_nulos_e_vazios,
SUM(ISNULL(loan_percent_income) +IF(loan_percent_income LIKE '', 1, 0) ) as loan_percent_income_nulos_e_vazios
FROM emprestimos;

# % de vazios ou nulos
SELECT 
(SUM(ISNULL(loan_id) +IF(loan_id LIKE '', 1, 0) )/ @total_de_emprestimos )*100 as percent_loan_id,
(SUM(ISNULL(loan_intent) +IF(loan_intent LIKE '', 1, 0) )/ @total_de_emprestimos )*100 as percent_loan_intent,
(SUM(ISNULL(loan_grade) +IF(loan_grade LIKE '', 1, 0) )/ @total_de_emprestimos )*100 as percent_loan_grade,
(SUM(ISNULL(loan_int_rate) +IF(loan_int_rate LIKE '', 1, 0) )/ @total_de_emprestimos )*100 as percent_loan_int_rate,
(SUM(ISNULL(loan_status) +IF(loan_status LIKE '', 1, 0) )/ @total_de_emprestimos )*100 as percent_loan_status,
(SUM(ISNULL(loan_percent_income) +IF(loan_percent_income LIKE '', 1, 0) )/ @total_de_emprestimos )*100 as percent_loan_percent_income
FROM emprestimos;

### historico_banco 

# Numero total de colunas

SET @total_de_historicos := (SELECT COUNT(*) FROM historicos_banco);
SELECT @total_de_historicos as numero_total_historicos;

# Numero de vazios ou nulos
SELECT 
SUM(ISNULL(cb_id) +IF(cb_id LIKE '', 1, 0) ) as cb_id_nulos_e_vazios,
SUM(ISNULL(cb_person_default_on_file) +IF(cb_person_default_on_file LIKE '', 1, 0) ) as cb_person_default_on_file_nulos_e_vazios,
SUM(ISNULL(cb_person_cred_hist_length) +IF(cb_person_cred_hist_length LIKE '', 1, 0) ) as cb_person_cred_hist_length_nulos_e_vazios
 FROM historicos_banco;
 
 # % de vazios ou nulos
SELECT 
(SUM(ISNULL(cb_id) +IF(cb_id LIKE '', 1, 0) ) / @total_de_historicos)*100 as percent_cb_id,
(SUM(ISNULL(cb_person_default_on_file) +IF(cb_person_default_on_file LIKE '', 1, 0) ) / @total_de_historicos)*100 as percent_cb_person_default_on_file,
(SUM(ISNULL(cb_person_cred_hist_length) +IF(cb_person_cred_hist_length LIKE '', 1, 0) ) / @total_de_historicos)*100 as percent_cb_person_cred_hist_length
 FROM historicos_banco;
 
 ### id
 
 SET @total_de_relacionamentos := (SELECT COUNT(*) FROM id);
SELECT @total_de_relacionamentos as numero_total_de_relacionamentos;

#numero de vazios
SELECT 
SUM(ISNULL(cb_id) +IF(cb_id LIKE '', 1, 0) ) as cb_id_nulos_e_vazios,
SUM(ISNULL(person_id) +IF(person_id LIKE '', 1, 0) ) as person_id_default_on_file_nulos_e_vazios,
SUM(ISNULL(loan_id) +IF(loan_id LIKE '', 1, 0) ) as loan_id_nulos_e_vazios
 FROM id;