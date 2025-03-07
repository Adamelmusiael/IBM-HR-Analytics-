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
###  Demographics  ✅
* Do younger employees leave more often than older ones?  
  **Yes** most employees leaving are in the 25-29 and 30-34 age group.
* Are men o woman leaving more?  
  There are about 240 records with employees that has decided to leave the company. **150 of them are men**. So **yes**.
* Does marital status affect attrition?  
  It might, **not significantly affect attrition**. Of all 240 leaving empleeys 120 are singles. Maybe they have bigger tendency for risk.
After answering this queries we can see some presumed patterns in the data. A significant number of people deciding to leave the company are young single male. This might mean that they are more opened for the new opportunities.  
### Job-related Factors  ✅
* Do employees with lower salaries leave more often?  
  Based on the median (since for this column it is a better metric than mean) divided in to 2 groups. 160 of employees living the company are earning leff then the median.
  **Yes**
* Does job satisfaction impact attrition?  
  **Yes** it does.(scale 1-4, where 1 is low and 4 is very high) Second biggest group that has decided to leave the company are people with job satisfaction at 1 lvl. What is actually more interesting is the fact that group with biggest attrition is 3-high satisfaction. I have decided to dive deeper into this problem. What I have found is even more interesting. Employees that has left the company were only scored as 4 or 3 in performance rating feature (outstanding & excellent performence). Does this mean that they are not beeing enough appriciated and rewarded?
  After diving deeper into the topic here is what I have found:      
    a. Their average salary hike is a bit smaller then companies average.  
    b. Just half of them do have stock options.  
    c. Average age is 33 - which fits to the "risk group" mentioned in the demographic search.  
* Does distance from home matter?  
  It seems like **it does** (not significantly). Although difference between attrition rate (attrition_rate=employees who left in group/total employees in group) for each group is not big there is a tendency- the further the office the bigger chance of leaving.
* Does work-life balance play a role?  
  The biggest attrition rate is the group of people with poor lief balance. In the rest of the groups the attrition rate was simmilar. Maybe the solution is to help employees with poor work life balance to manage their time better to keep them in company?
After reviewing this topic we might need to concider better ways of appreciation the employees, especially in some groups. 
### Company-Related Factors✅
* Do employees with fewer years at company leave more often?  
  Yes they do. The longer the employee work in the company the smallee chances of him leaving are.
* Does something (some of the other features) changes significantly through years employee is working in this company?  
  Thing that changes the most is average monthly income. Some of the other features that has changed not significantly are: performence and involvement wchich might be natural that more experienced employees are seen as more better and more involvement. 
* Are certain departaments experiencing more attrition?  
  Becouse of the EDA we do know that most of employees in this dataset work in Research & Developement department. Thus we need to use attrition rate in order to evaluate which department is experiencing more attrition. Biggest attrition by attrition rate was expeienced in the **Sales and Human Resources** departments (about **20% for each** of them). While Research & Developement had attrition rate equal to 13%. If it comes to the numbers we need to notice that in **R&D** the number of employees that left the company was **133**, which is more then the half of whloe companies attrition.
* Does frequent job role change impact attrition?  
After first query have found an interesting pattern employees how worked: 0,2,3,4 companies - their **attrition** rate is about **11%**, 5+ companies - **20-25% attrition** this employees might be people that are just seeking better opportunities so company should concider investing in their growth and 1 compnay employees - 18% attrition, this employees might be early in their careers and they expectations has just met the reality. 

# 2. Data Visualization and Insights
Now our objective is to visualize key insights and trends in the data. I need to 
