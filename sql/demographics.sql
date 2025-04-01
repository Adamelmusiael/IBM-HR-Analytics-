SELECT * FROM ibm_table
--                                                     ------------------DEMOGRAPHICS------------------
-- Do younger employees leave more often than older ones?
CREATE VIEW age_vs_attrition AS 
SELECT 
    CASE 
        WHEN Age BETWEEN 18 AND 24 THEN '18-24'
        WHEN Age BETWEEN 25 AND 29 THEN '25-29'
        WHEN Age BETWEEN 30 AND 34 THEN '30-34'
        WHEN Age BETWEEN 35 AND 39 THEN '35-39'
        WHEN Age BETWEEN 40 AND 44 THEN '40-44'
        WHEN Age BETWEEN 45 AND 49 THEN '45-49'
        WHEN Age BETWEEN 50 AND 54 THEN '50-54'
        WHEN Age BETWEEN 55 AND 59 THEN '55-59'
        ELSE '60+' 
    END AS age_range,
    COUNT(*) AS num_employees_leaving
FROM ibm_table
WHERE Attrition = 'Yes'
GROUP BY age_range
ORDER BY age_range;


-- Are men or woman leaving more?
CREATE VIEW gender_attrition AS 
SELECT
    gender,
    COUNT(*) AS num_of_employees_leaving
FROM ibm_table
WHERE Attrition = 'Yes'
GROUP BY gender
ORDER BY num_of_employees_leaving DESC;


--Does marital status affect attrition?
CREATE VIEW marital_status_vs_attrition AS 
SELECT
    maritalstatus,
    COUNT(*) as num_of_employees_leaving
FROM ibm_table
WHERE attrition = 'Yes'
GROUP BY maritalstatus
ORDER BY num_of_employees_leaving DESC;






--                                                     ------------------Job-Related Factors------------------
-- Do employees with lower salaries leave more often?
-- To answer this we need to get info about mean salary or median salary (In this case median is more revelant since mean is influenced by high values).
-- From our EDA we know that median of MonthlyIncome in this company is equalt to 4919 (round to 4900)
-- Having median will let us devide employees into group with smaller salaries and bigger salaries
CREATE VIEW monthly_income_vs_attrition AS
SELECT
    CASE 
        WHEN monthlyincome < 4900 THEN 'smaller_income'
        WHEN monthlyincome >= 4900 THEN 'bigger_income'
    END AS income_group, 
    COUNT(*) AS num_of_employeesleaving
FROM ibm_table
WHERE attrition = 'Yes'
GROUP BY income_group;


--Does job satisfaction impact attrition?
CREATE VIEW job_satisfaction_vs_attrition  AS
SELECT 
    jobsatisfaction,
    COUNT(*) as num_of_employees_leaving 
FROM ibm_table
WHERE attrition = 'Yes'
GROUP BY jobsatisfaction
ORDER BY jobsatisfaction ASC;

-- Lets dive deeper. What number of highly satisfied employees are also ranked as well performing( 2 >= Performance feature scale 1-4, where 1-"low" and 4-"outstanding")?
CREATE VIEW further_analysis_job_satisfaction AS
SELECT 
    jobsatisfaction,
    performancerating,
    COUNT(*) as num_of_employees_leaving 
FROM ibm_table
WHERE attrition = 'Yes' AND jobsatisfaction = 3
GROUP BY jobsatisfaction, performancerating
ORDER BY jobsatisfaction ASC;

CREATE VIEW job_satisfaction_other_params AS
SELECT
    jobsatisfaction,
    AVG(percentsalaryhike) as avg_salary_hike,
    AVG(stockoptionlevel) as avg_stock_option,
    AVG(age) as avg_age,
    AVG(yearsatcompany) as avg_years_in_comp,
    AVG(yearsincurrentrole) as avg_years_in_current_role
FROM ibm_table
WHERE attrition = 'Yes' AND jobsatisfaction = 3
GROUP BY jobsatisfaction;

--Does distance from home matter?
SELECT MIN(distancefromhome) as mini,
MAX(distancefromhome) as maxi,
AVG(distancefromhome) as avvg,
percentile_cont(0.5) WITHIN GROUP (ORDER BY distancefromhome) AS median
FROM ibm_table;

-- Attrition rate and distance from office
CREATE VIEW discance_vs_attrition AS 
SELECT
    CASE
        WHEN distancefromhome <= 5 THEN '0-5'
        WHEN distancefromhome <= 10 THEN '6-10'
        WHEN distancefromhome <= 15 THEN '11-15'
        WHEN distancefromhome <= 20 THEN '16-20'
        ELSE '21+'
    END AS distance_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) as employees_left,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)*100/ COUNT(*),2) AS attrition_rate
FROM ibm_table
GROUP BY distance_group
ORDER BY attrition_rate DESC;


-- Does work-life balance play a role?
CREATE VIEW worklifebalance_vs_attrition AS
SELECT 
    worklifebalance,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) as employees_left,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)*100/ COUNT(*) AS attrition_rate
FROM ibm_table
GROUP BY worklifebalance
ORDER BY attrition_rate DESC;


--                                                     ------------------Company-Related Factors------------------
-- Do employees with fewer years at company leave more often?
CREATE VIEW years_at_com_vs_attrition AS 
SELECT
    CASE 
        WHEN yearsatcompany <= 1 THEN '0-1'
        WHEN yearsatcompany <= 3 THEN '1+ to 3'
        WHEN yearsatcompany <= 5 THEN '3+ to 5'
        WHEN yearsatcompany <= 7 THEN '5+ to 7'
        WHEN yearsatcompany <= 10 THEN '7+ to 10'
        WHEN yearsatcompany <= 15 THEN '10+ to 15'
        ELSE '15+'
    END AS years_at_company_groups,
    COUNT(*) AS total_employees,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)*100/COUNT(*),2) as attrition_rate 
FROM ibm_table
GROUP BY years_at_company_groups
ORDER BY attrition_rate DESC;


--Does something (some of the other features) changes significantly through years employee is working in this company?
CREATE VIEW tensure_groups AS 
SELECT
    CASE
        WHEN yearsatcompany < 5 THEN '0 to 4'
        WHEN yearsatcompany BETWEEN 5 AND 7 THEN '5 to 7'
        WHEN yearsatcompany < 11 THEN '7+ to 10' 
        ELSE '10+'
    END as tensure_group,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)*100/COUNT(*),2) AS attrition,
    AVG(jobsatisfaction) as avg_jobsatisfaction,
    AVG(monthlyincome) as avg_monthly_income,
    AVG(percentsalaryhike) as avg_salary_hike,
    AVG(performancerating) as avg_performance_rating,
    AVG(jobinvolvement) as avg_job_involvement,
    AVG(environmentsatisfaction) as avg_enviroment_satisfaction
FROM ibm_table
GROUP BY tensure_group;


-- Are certain departaments experiencing more attrition?  
CREATE VIEW departament_vs_attrition AS 
SELECT
    department, 
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)*100 /COUNT(*),2) AS attrition_rate
FROM ibm_table
GROUP BY department
ORDER BY attrition_rate DESC;


-- Does frequent job role change impact attrition? 
CREATE VIEW num_companies_worked_attrition AS 
SELECT
    numcompaniesworked,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)*100/ COUNT(*),2) AS attrition_rate
FROM ibm_table
GROUP BY numcompaniesworked
ORDER BY numcompaniesworked ASC;
--What long do they stay in the company?
SELECT
    numcompaniesworked,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END)*100/ COUNT(*),2) AS attrition_rate,
    AVG(yearsatcompany) AS avg_years_at_company
    Perce
FROM ibm_table
GROUP BY numcompaniesworked
ORDER BY numcompaniesworked ASC;


--                                                     ------------------Additional Queries------------------

-- AVG salary vs avg salary of those who has left by joblevel
CREATE VIEW salary_joblevel_vs_attrition AS 
SELECT JobLevel, 
       ROUND(AVG(MonthlyIncome),2) AS avg_salary,
       ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN MonthlyIncome END),2) AS avg_salary_leaving_emp,
       ROUND(AVG(YearsAtCompany),2) AS avg_years_at_company,
       COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS num_leaving
FROM ibm_table
GROUP BY JobLevel
ORDER BY JobLevel ASC;



-- AVG salary vs avg salary of those who has left by peformance
CREATE VIEW salary_performance_vs_attrition AS 
SELECT performancerating, 
       ROUND(AVG(MonthlyIncome),2) AS avg_salary,
       ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN MonthlyIncome END),2) AS avg_salary_leaving_emp,
       ROUND(AVG(YearsAtCompany),2) AS avg_years_at_company,
       COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS num_leaving
FROM ibm_table
GROUP BY performancerating
ORDER BY performancerating ASC;


-- What are the biggest differences between those who stayed and those who has left
CREATE VIEW differences_attrition AS 
SELECT
    attrition,
    AVG(jobsatisfaction) as avg_jobsatisfaction,
    AVG(monthlyincome) as avg_monthly_income,
    AVG(percentsalaryhike) as avg_salary_hike,
    AVG(performancerating) as avg_performance_rating,
    AVG(jobinvolvement) as avg_job_involvement,
    AVG(joblevel) as avg_joblevel,
    AVG(environmentsatisfaction) as avg_enviroment_satisfaction
FROM ibm_table
GROUP BY attrition;




SELECT *
FROM ibm_table