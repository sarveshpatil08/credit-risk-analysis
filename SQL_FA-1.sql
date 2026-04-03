create database Banking_case;

use Banking_case ;
show tables;

select * from bank_customers;

SELECT COUNT(*) FROM bank_customers; 
describe banking_case;
ALTER TABLE bank_customers
ADD risk_label VARCHAR(20);

SET SQL_SAFE_UPDATES = 0;

UPDATE bank_customers
SET risk_label = 
    CASE 
        WHEN LOAN_TO_INCOM_RATIO > 2 and EMI_RATIO > 0.4 THEN 'High Risk'
        WHEN LOAN_TO_INCOM_RATIO BETWEEN 1 AND 2 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END
WHERE 1=1;


SELECT risk_label, COUNT(*) 
FROM bank_customers
GROUP BY risk_label;    

SELECT COUNT(*) 
FROM bank_customers;

SELECT 
    risk_label,
    ROUND(AVG(INCOME),0) AS avg_income
FROM bank_customers
GROUP BY risk_label;

SELECT 
    risk_label,
    ROUND(AVG(CREDIT),0) AS avg_loan
FROM bank_customers
GROUP BY risk_label;

SELECT 
    risk_label,
    ROUND(AVG(EMI_RATIO),2) AS avg_emi_ratio
FROM bank_customers
GROUP BY risk_label;

SELECT 
    risk_label,
    ROUND(AVG(LOAN_TO_INCOM_RATIO),2) AS avg_lti
FROM bank_customers
GROUP BY risk_label;

SELECT 
    CASE 
        WHEN AGE < 30 THEN 'Young'
        WHEN AGE BETWEEN 30 AND 50 THEN 'Middle Age'
        ELSE 'Senior'
    END AS age_group,
    risk_label,
    COUNT(*) AS total
FROM bank_customers
GROUP BY age_group, risk_label
ORDER BY age_group;

SELECT 
    risk_label,
    ROUND(AVG(EMPLOYED_YEARS),1) AS avg_emp_years
FROM bank_customers
GROUP BY risk_label;

SELECT 
    risk_label,
    ROUND(AVG(FAM_MEMBERS),1) AS avg_family_size
FROM bank_customers
GROUP BY risk_label;

SELECT *
FROM bank_customers
WHERE risk_label = 'High Risk'
ORDER BY LOAN_TO_INCOM_RATIO DESC
LIMIT 20;

SELECT * FROM bank_customers;











