# Plan, Goals, Notes
This section is dedicated to notes, plans, goals. It is meant to help me create the project and than present key information about it. Therefore it might be a little messy. In this project ,I would like to showcase my data analytics, data science and machine learning skills simoultaneously. I want to present how all of mentioned skills can be used in one project. 

# 1. Data Exploration and Understanding
I will start by exploring the dataset and gaining a deeper understanding of it. To perform any further analysis and modifications, I need to understand the data. My main tools for this purpose will be both Python (Jupyter Notebooks) and SQL(PostgreSQL), where I will explore and transformthe data. Additionally, I will use Excel for documentation and reporting. Using Excel in this project is mainly intended to make it easier for others who do not know Python, SQL, etc., to view my work and perform simple operations that do not require advanced technologies.   
**Tasks:**
* Load and prepare data for EDA in **jupyter notebook**✅
* Display basic statistics ✅
  From the basic statistics, we can start imagining an average employee of this company. On average, an employee's age is 36. They are promoted quite often and similarly change their managers frequently. On average, employees work about 7 years in the company.
* Dheck for missing values & duplicates ✅
  There are no missing values and no duplicates.
* Analyze distribution of categorical variables✅
  Briefly... From the whole dataset (about 1.5k samples), only about 250 employees have left the company. Most employees do not travel for business purposes. The majority of employees work in the Research & Development department. More than half of the employees in the dataset have at least a bachelor's degree. High performance ratings and work-life balance are generally well maintained.
* Create charts, plots, etc., if needed ✅
* Export key statistics to an Excel file for documentation ✅

# 2.Investigate Factors Influencing Attrition
In this section, we need to dive deeper into the data. To gain more insight into what might influence employee attrition, we need to answer some questions. This time, I will mainly use SQL (PostgreSQL).  
###  Demographics  ✅
* Do younger employees leave more often than older ones?  
  **Yes**. Most employees leaving are in the 25-29 and 30-34 age groups.
* Are men o woman leaving more?   
  There are about 240 records of employees who have left the company. 150 of them are men. So **yes, men leave more often**.
* Does marital status affect attrition?    
  It might, but **not significantly**. Of the 240 employees who left, 120 were single. Maybe they have a higher tendency for risk.
After answering these queries, we can see some presumed patterns in the data. A significant number of people deciding to leave the company are young, single males. This might mean that they are more open to new opportunities and challenges.
### Job-related Factors  ✅
* Do employees with lower salaries leave more often?  
  Based on the median (since for this column, it is a better metric than the mean), 160 of the employees leaving the company are earning less than the median. **Yes**.
* Does job satisfaction impact attrition?  
  **Yes, it does.** (Scale: 1-4, where 1 is low and 4 is very high). The second-largest group that decided to leave the company had job satisfaction at level 1. Interestingly, the largest attrition group was at level 3 - high satisfaction. After further investigation, I found that employees who left the company were only rated 3 or 4 in performance (Outstanding & Excellent performance). This raises the question: Are they not being adequately appreciated and rewarded?
After deeper analysis, I found:      
    *a.* Their average salary increase was slightly lower than the company average.  
    *b.* Only half of them had stock options.  
    *c.* Average age is 33, which fits the "risk group" mentioned in the demographic section.
* Were employees on the same job level who left paid less than those who stayed?  
  **Yes**, for some job levels (1, 3, 4).
* Were employees with the same performance rating who left paid worse?  
 Yes, employees with the same performance rating and similar average years in the company were significantly paid worse on average.
* Does distance from home matter?  
  It seems like **it does** (not significantly). Although differences in attrition rates (attrition rate = employees who left in group / total employees in group) are small, there is a tendency—the farther the office, the higher the likelihood of leaving.
* Does work-life balance play a role?  
  The highest attrition rate is among employees with poor work-life balance. The attrition rate is similar in other groups. Perhaps the company should help employees with poor work-life balance manage their time better to retain them.
### Company-Related Factors✅  
* Do employees with fewer years at company leave more often?  
 **Yes**, they do. The longer an employee works at the company, the lower their chances of leaving.
* Does anything change significantly over the years an employee works at the company?  
  The most significant change is average monthly income. Other small changes include performance ratings and involvement, which may be natural since more experienced employees tend to be rated better.
* What are the biggest differences between those who stayed and those who left?
 Employees who left had lower job satisfaction, earned less, had a smaller salary increase, lower job levels, and were less satisfied with the environment than those who stayed.
* Are certain departaments experiencing more attrition?  
  Since most employees work in Research & Development, we use the attrition rate to evaluate departments equally. The highest attrition rates are in Sales and Human Resources (~20%), while Research & Development is 13%. However, 133 of 240 employees who left were from R&D, meaning it represents the largest share of attrition in absolute numbers.
* Does frequent job role change impact attrition?  
Employees who worked 5+ previous companies had 20-25% attrition, significantly higher than those who worked at fewer companies. Employees who previously worked at 1 company had 18% attrition, indicating that early-career employees may have misaligned expectations.

# 3. Data Visualization and Insights
Now, our objective is to visualize key insights and trends in the data. Since most of the work done in the powerBI is self explanatory I will just make a brief note about each pages and colors/styles used.  
**Dashboard Summary** 
1. **Overview Page**: Displays key KPIs, trends in attrition, and the most important insights for data understanding.
2. **Job-Related Factors Page**: Focuses on attrition rates by salary, satisfaction, salary importance, and work-life balance.
3. **Company-Related Factors Page**: Examins department wise attrition, company attrition, tenure, and past work experience influence.
**Key Findings:**
* The biggest attrition issue in terms of numbers is in Research & Development, but attrition rates are similar across all departments.
* Employees with 0-1 years of tenure have >30% attrition, while those with more seniority have <20% attrition.
* Employees who previously worked for 5+ companies have the highest attrition rate, likely job-hopping for better opportunities.

# 4. Feature Importance Using ML
In this section, I will use machine learning to identify the most important features. This process involves data encoding (as some models require numeric input), model training, extracting feature importance from models, and utilizing SHAP to enhance interpretability. Finally, I will visualize the results and combine all methods into a single plot.

To fairly compare the importance scores from different methods, I applied L1 normalization. After normalization, I calculated the average importance for each feature.

As a result, I identified the 10 most important features. 


![image](https://github.com/user-attachments/assets/8961c4ac-db14-40a6-91b6-8e7dba91cd89)


Thanks for this method I have found out about some other important features that I did not concider before. Here are some of these features:  
1. OverTime - this feature tells us if employee did work more then planned. As it turned out this method ranked it as the most important one.
2. DailyRate - in other words daily salary of the employee. Also highly ranked one.
3. HourlyRate - just like the previous one.
Analyzing top 10 featuers produced by this method we can see that a lot of them contain information about the money the employee was/is earning. This proves my previous point.



  
