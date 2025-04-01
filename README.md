# Employee Attrition Analysis

## Project Overview 🏁
This project aims to showcase my data analytics, data science, and machine learning skills by analyzing employee attrition using various tehchniques. The goal is to explore, analyze, visualize and predict factor influencing employee turnover.

## Obejctives 📌
1. **Understand and explore dataset** using python (Jupyter Notebooks), SQL (PostgreSQL), Excel.
2. **Investigate key factors** influencing **attrition** through statistical and exploratory data analysis (EDA).
3. **Visualize** insights using Power BI for better interpretability.
4. Use machine learning models to determine **feature importance** in predicting attrition.

## Tools & Technologies Used ⚒️
* Python (Pandas, Numpy, Matplotlib, Scikit-Learn, XGBoost...)- Data exploring, processing, visualization, and machine learning.
* PostgreSQL- Querying and analyzing the data.
* Excel- Reporting and documentation.
* PowerBI- Creating dashboards for visualization.
* Machine Learning Models- Feature importance extraction.

# 1. Data Exploration and Understanding 📖
## Key Steps:
Load and prepare data for analysis, dispaly basic statistics to get an overview, check for missing values and duplicates (none found), analyze categorical variable distributions, visualize data through various plots, export key findings to excel firle for documentation.
### Initial insights:
- Average employee age: **36 years**.
- Most employees work in the **Research & Development** department.
- Employees work an average of **7 years** in the company.
- **Attrition rate** is low, about **16%** (250 out of 1.5K employess left).
- High performance ratings and work-life balance are generally well maintained.

# 2. Investigating Factors Influencing Attrition 🔍
To gain deeper insights, SQL queries were used to answer key questions about employee demographics, job satisfaction, and salary.
## Demographics Analysis ✅
* Young employees **(25-34)** leave more often.
* Men have a **slightly higher attrition rate than women** (150 out of 240 employees who left were men).
* Single employees have a higher attrition rate, but the impact is minor.

## Job-Realted Factors ✅
* **Lower salaries** correlate with **higher attrition**.
* **Job satisfaction** affects attrition (employees with the lowest satisfaction had higher turnover).
* Employees with similar job levels who left were **paid less** than those who stayed.
* Performance rating is linked to attrition – **employees with high ratings but low salary increases left.**
* Distance from home has a **slight impact** on attrition (farther employees tend to leave more).
* Poor work-life balance is linked to higher attrition.

## Company Related Factors ✅
* Employees with **fewer years** at the company are more **likely to leave.**
* Biggest attrition issues (in absolute numbers) are in Research & Development.
* **Job-hopping behavior is common** – employees who worked in 5+ companies have a much higher attrition rate.

# 3. Data Visualization & Insights 📈
A Power BI dashboard was created to visualize key findings.
## Dashboard Summary
1. **Overview Page:** Displays key KPIs, trends in attrition, and employee demographics.
![Overview](https://github.com/user-attachments/assets/a3dd9415-bca5-4284-a152-080f8af257a8)


2.**Job-Related Factors Page:** Focuses on salary, job satisfaction, performance, and work-life balance. 
![Job-Related](https://github.com/user-attachments/assets/a73c6470-a7c2-48a5-ae56-170b634faadb)


3.**Company-Related Factors:** Examines attrition rate by department, tenure, seniority and attrition correlation, and past job experience.
![Company-Related](https://github.com/user-attachments/assets/dfa5bea7-45dd-432a-b2e4-8ba2a9d5e06d)

Key Findings:
* Highest attrition rate in **Sales and HR** (~20%)
* Employees with 0-1 years of seniority in compeny have >30% attrtition rate
* Employees who worked in 5+ companies before have the highest attrition rates.

# 4. Feature Importance Using Machine Learning 🤖
To identify the most important features influencing attrition, I used multiple machine learning models and SHAP values.

### Steps:
✅ Data encoding (converting categorical features into numeric).  
✅ Model training to extract feature importance.  
✅ SHAP analysis to enhance interpretability.  
✅ Visualization of feature importance.  
✅ Combininb methods using **L1 normalization** to fairly compare results.

### Results
After normalization, I computet the average feature importance and identified the **top 10** most important features influcencing attrition. Most of the features coincided with my assumptions, but thanks to this method I have found some new important features. 
- **OverTime:** employees working more then planned tend to have bigger attrition rate.
- **DailyRate and HourlyRate:** this 2 features prooved that salary is highly important for most of the employees

 Here are the results of this method:
![Top10MostImportantFeatures](https://github.com/user-attachments/assets/be53afa0-8cf1-4e96-8ba8-1423172dd20d)

## Installation
To run this project locally:  
1. Clone the repository:  
  git clone:  https://github.com/Adamelmusiael/IBM-HR-Analytics-.git  
2. Install dependencies:   
  pip install -r requirements.txt  
3. Run Jupyter Notebook:  
  jupyter notebook  
4. Any other files should be in cloned enviroment.  


## Acknowledgments
This project was inspired by IBM HR Analytics dataset, showcasing real world problems that can be solved using data analysis and data science techniques.  
📌 **Contact:** For any questions or suggestions, feel free to reach out!
🚀 _Hope you find this analysis insightful!_
