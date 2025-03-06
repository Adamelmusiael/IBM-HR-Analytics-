# Plan, Goals, Notes
In this project I would like to show my data analystics data science and machine learning skills at once. For that reason I will try to use multiple tools in order to show my wide range of skills.

# 1. Data Exploration and Understanding
I will start with exploring the dataset and trying to get more into it. To do any further analysis and modifications I need to understand it. My main tools for this purpose will be **python** (jupyter notebooks) , where I will be exploring the data. Secondly I will use Excelfor **documentation and reporting**. Using Excel in this project will is mainly intended to make it easier for other people who do not know python,sql etc. to view my work and to perform simple operations that do not require advanced technologies.    
Tasks:
* Load and prepare data for EDA in **jupyter notebook**✅
* Display basic statistics ✅
  From the basic statistics we can start imagining an average employee of this company. ON AVERAGE employee's age is 36, they are beeing quite often promoted and simillary they often change their managers, on average employees work about 7 years in company.
* check for missing values & duplicates ✅
  There are no missing values and no duplicates.
* analyze distribution of categorical variables✅
  Shortley... From the whole dataset (about 1.5k samples) there are only about 250 employees that have left the company. Most of the employees do not travel in business purposes. Most employees are in the Research & Developement department. More then half of the employees in the dataset have at least bachelor. High performance rating. Work life balance is preserved.
* create charts, plots etc. if needed✅
* export key statistics to excel file for documentation✅

# 2.Investigate Factors Influencing Attrition
In this section we need to dive deeper in to the data. To get more intuition on what might influent employee's attrition we need to answer some questions. This time I will mainly use **SQL** (PostgreSQL).
###  Demographics
* Do younger employees leave more often than older ones?
* Are men o woman leaving more?
* Does marital status affect attrition?
### Job-related Factors
* Do employees with lower salaries leave more often?
* Does job satisfaction impact attrition?
* Does distance from home matter?
* Does work-life balance play a role?
### Company-Related Factors
* Do employees with fewer years in company leave more often?
* Does something (some of the other features) changes significantly through years employee is working in this company? 
* Are certain departaments experiencing more attrition?
* Does frequent job role change impact attrition?
  ...
