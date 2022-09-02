SHOW TABLES;

SELECT COLUMN_NAME AS Nome_da_coluna, DATA_TYPE AS tipo_de_dados FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'analise_risco' AND TABLE_NAME = 'dados_mutuarios';

SELECT COLUMN_NAME AS Nome_da_coluna, DATA_TYPE AS tipo_de_dados FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'analise_risco' AND TABLE_NAME = 'emprestimos';

SELECT COLUMN_NAME AS Nome_da_coluna, DATA_TYPE AS tipo_de_dados FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'analise_risco' AND TABLE_NAME = 'historicos_banco';

SELECT COLUMN_NAME AS Nome_da_coluna, DATA_TYPE AS tipo_de_dados FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'analise_risco' AND TABLE_NAME = 'id';

### dados_mutuarios 
SET @total_de_clientes := (SELECT COUNT(*) FROM dados_mutuarios);
SELECT @total_de_clientes as numero_total_clientes;

# Varificando IDs repitidos;
SELECT person_id, COUNT(*) FROM dados_mutuarios GROUP BY person_id HAVING COUNT(*) > 1;

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

# Varificando IDs repitidos;
SELECT loan_id, COUNT(*) as numero_repetidos FROM emprestimos GROUP BY loan_id HAVING COUNT(*) > 1;



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

# Varificando IDs repitidos;
SELECT cb_id, COUNT(*) as numero_de_repetidos FROM historicos_banco GROUP BY cb_id HAVING COUNT(*) > 1;

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

# Número de repetidos
SELECT person_id, loan_id, cb_id, COUNT(*) as total_repetidos FROM id GROUP BY person_id, loan_id, cb_id HAVING COUNT(*) > 1;

#numero de vazios
SELECT 
SUM(ISNULL(cb_id) +IF(cb_id LIKE '', 1, 0) ) as cb_id_nulos_e_vazios,
SUM(ISNULL(person_id) +IF(person_id LIKE '', 1, 0) ) as person_id_default_on_file_nulos_e_vazios,
SUM(ISNULL(loan_id) +IF(loan_id LIKE '', 1, 0) ) as loan_id_nulos_e_vazios
 FROM id;

# Tratamento dos dados

# Nas colunas de texto alterar os valores nulos para ''
UPDATE dados_mutuarios SET 
    person_home_ownership = IF(ISNULL(person_home_ownership), '', person_home_ownership),
    person_id = IF(ISNULL(person_id), '', person_id);
    
UPDATE historicos_banco SET
	cb_person_default_on_file  = IF(ISNULL(cb_person_default_on_file), '', cb_person_default_on_file);

# Removendo as 4 colunas com códigos vazios de dados_mutuarios

DELETE FROM dados_mutuarios  WHERE person_id LIKE '';
SELECT * FROM dados_mutuarios WHERE person_id LIKE '';

#  Unir as tabelas de acordo com os IDs traduzir os dados e exportar para CSV
SELECT  
m.person_id as id_pessoa, hb.cb_id as id_historico_banco, e.loan_id as id_emprestimo,
m.person_age as idade, m.person_income as salario_anual, m.person_home_ownership as situacao_propriedade, m.person_emp_length as tempo_trabalho,
e.loan_intent as motivo_emprestimo, e.loan_grade as pontuacao_emprestimo, e.loan_amnt as valor_solicitado, e.loan_int_rate as taxa_de_juros, e.loan_status as possibilidade_inadimplencia, e.loan_percent_income as percentual_emprestimo_salario,
hb.cb_person_default_on_file as eh_inadimplente, hb.cb_person_cred_hist_length as tempo_primeira_solicitacao_credito
from (((id  
	INNER JOIN dados_mutuarios m ON id.person_id = m.person_id) 
    INNER JOIN emprestimos e ON e.loan_id = id.loan_id)
    INNER JOIN historicos_banco hb ON hb.cb_id = id.cb_id );

