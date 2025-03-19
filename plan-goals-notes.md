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
  Based on the median (since for this column it is a better metric than mean) divided in to 2 groups. 160 of employees living the company are earning less then the median.
  **Yes**
* Does job satisfaction impact attrition?  
  **Yes** it does.(scale 1-4, where 1 is low and 4 is very high) Second biggest group that has decided to leave the company are people with job satisfaction at 1 lvl. What is actually more interesting is the fact that group with biggest attrition is 3-high satisfaction. I have decided to dive deeper into this problem. What I have found is even more interesting. Employees that has left the company were only scored as 4 or 3 in performance rating feature (outstanding & excellent performence). Does this mean that they are not beeing enough appriciated and rewarded?
  After diving deeper into the topic here is what I have found:      
    a. Their average salary hike is a bit smaller then companies average.  
    b. Just half of them do have stock options.    
    c. Average age is 33 - which fits to the "risk group" mentioned in the demographic search.
* Were employees on same job level who has left worse paied then those who has stayed?  
  Some job levels like 1,3,4 employees who has left were paid less. ** Yes, some of them**
* Were employees on same performance rating, who has left paid worse?  
  **Yes**, employees with same peferformance rating and similar average yeasr in comapny were significantly paid worse on average.
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
* What are the biggest differences between those who stayed and those who has left?
  There are some differences. First of all employees who has left seem to have smaller job satiscation, they were earning less with slightly smaller salaty hike,  had smaller job level and wer not as much satisfied with enviroment as those who has stayed. 
* Are certain departaments experiencing more attrition?  
  Becouse of the EDA we do know that most of employees in this dataset work in Research & Developement department. Thus we need to use attrition rate in order to evaluate which department is experiencing more attrition. Biggest attrition by attrition rate was expeienced in the **Sales and Human Resources** departments (about **20% for each** of them). While Research & Developement had attrition rate equal to 13%. If it comes to the numbers we need to notice that in **R&D** the number of employees that left the company was **133**, which is more then the half of whloe companies attrition.
* Does frequent job role change impact attrition?  
After first query have found an interesting pattern employees how worked: 0,2,3,4 companies - their **attrition** rate is about **11%**, 5+ companies - **20-25% attrition** this employees might be people that are just seeking better opportunities so company should concider investing in their growth and 1 compnay employees - 18% attrition, this employees might be early in their careers and they expectations has just met the reality.

# 2. Data Visualization and Insights
Now our objective is to visualize key insights and trends in the data. 
* Get the table, views and transform if needed (PowerBI) ✅
* Structure/plan of the dashboard.   MODIFY
  I will create 3 pages in this dashboard for clean and meaningfull data visualization. First one will be Overview, here I will include key KPI's, trends in attrition and most important informations for better data understanding. Next three pages will be divided by: Demographic (attrition by age, gender maritial status), but I will concider including this in first page, Job related factors (attrition rat) 
* Notes/findings
Looking on pie plot we can see that the biggest problem with attrition is in the Research & Developement department about 56%, Sales 39% and HR 5%. This tells us that the biggest number of employees leving is in Research & Development. However we need to mention one important difference in those departments, size. Research & Developement is much bigger than other departments. So let's see on the attrition in order to evaluate this departments equally. **Attrition Rate by Department* column chart tells us that the problem is simmilar in all of these departments. What is actually interesting by procentage the smallest attirion is in the Research & Developement. This might mean that the simmilar problem may be in the company. So yes most employees who has left the company were from the R&D but attrition is simmilar in each department. 
  
**Seniority in the Company and Attrition Rate** There is overall tendention taht employees with bigger seniority has way smaller attrition rate. Employees with 0-1 seniority have 30% attrition and employees with more than 1 year at company less then 20% AR. This might suggest that if we encourage ew employees to stay longer with us there will be huge chance of their bigger seniority in future. 
On the plot **"Impact of Past Work Experience on Attrition and Tenure"** we can see some interesting patterns.
We have 2 contexts here attiriton rate and Average Years at Company
First of all Attirtion rate is much bigger for employees for employees that has worked for 5 or more companies. Also it is quite big for ppl that has worked for 1 company this might mean that they might still looking for their place. However their avg years at comapny is one of the highest. This might tell us that there are 2 main groups of ppl. 1 Those who like to settle and build their position in one company. And those that are seeking potential upgrades and better opportunities. Smaller attrition is beeing noticed for employees that has worked for 0 and 2-4 companies previously but also they stay in comapny on average 5 years. The overall tendention: The more companies employee worked for the biggest attrition rate is. Employees with less then 5 previous companies are having the smallest attirion rate. This 3 features might be even more correlated it would be greate to analyze them even further but there are not many emploees with more then 5 companies worked for. Need to get more data.

 Not everything got written down here. Some of key information were written down in my notebook. All of the most important informations will be included in the main note.

 # Key information to mention on the presentation:
There are 3 pages. Each of them plays different role in this presentation. First page is ment to present basic information so the public can follow up. Next to pages are ment to present most important factors that may influent attrition.
**OVERVIEW**
1.Analysis was made on the sample of almost 1500 employees. Almost 240 of them decided to leave the company. 
2. Key KPI's:   
- Average Seniority - Average number of years employees worked in the company,
- Attrition Rate (%) - This rate helps us to investigate the problem with attrition in different situations fairly. (Attrition Rate(%) = Resignees/Total Employees *100)
- Salary Hike,
- Low Paid Resignees - Shows the number of people that has left the company and were paid less then the median.
3. Basic information:
- Often employees that are living the company are Males and and are in the 25-36 age group. This might suggest us that for the job roles that require smaller employee attrition we should concider choosing females or people that are older then 36 yo.
- Job Satisfaction is important factor since many employees that has left the company were not satisfied with their job. However, there is a wird statistics that shows us that most employees who has left by job satisfaction are employees with job satisfaction 3. We will investigate this in moment.  
**Job Related Factors**
There are some factors that seem to be important in context of attrition. First of all, huge amount of resignees were low-paid.
Wird statistic:
As mentioned earlier the biggest attrition is beeing noticed for people with job satisfaction 3. It seems not intuitive but there might be some reasons that will help us to understand this problem.
Firstly, let's notice that all of the people with job satisfaction 3 were rated as well performing (3 and 4 are the highest possible ratings). This tells us that they were both satisfied and were well performing. This drives us to the obvious question. Were they rewarded and appreciated enough? Here are some statistics that will help as find the answer (All factors are calculated for the resignees with job satisfaction 3 ):
- about 85% of employees were paid less,
- the average job level 1,59 (5 is max),
- average salary hike was smaller then the companies average,
- None of them were allowed to have companies stocks.
If we combine all of the infomrmations above we can clearly see that this employees were most likely not appreciated enough. It would be greate to concider some of the possible ways of rewarding employees especially those that are performing well.
Importance of well suited sallary:
We already know that satisfied employees require adequate sallary. Monthly income is highly correlated with the attrition. We can see this on the following plot (top right corner). It shows us that a lot of employees who has left the company were paid less then their colleagues on each of the job levels there is a simmilar tendention.
Bottom-right line chart shows that employees who work further from home are more likely to leave company. If possible it might be important to offer them remore of hybrid work.  
**Company Related Factors**
First let's concider which department is dealing with the biggest attrition. Definitely the biggest number of employees that are leaving our company is in the Research and Development and in Sales. But we need to keep in mind that this departments are way bigger then HR, thus the number of employees leaving will be bigger. In oreder to evaluate this problem equaly look at the bar chart in the bottom left corner. This shows us that the attrition problem is almost same in each of the departments. Proportionally to their size... Conclusion? Biggest number resignees- R&D and Sales, but attrition rate is simmilar in every department listed.  
Next important factor is seniority- top right bar chart. The bigger the seniority, the smaller are chances that employee will leave the company.
Another thing worth mentioning is the number of companiees emlpoyee has worked for. We can see that for following numbers 0,2,3,4 attrition is small. It starts to grow when employee has worked for many companies. This may mean that employee is often switching companies in order to find better opportunities.
Also the biggest chance of catching the workers to stay longer is at the beggining of their career. If we play this well we can get loyal and well thought/trained employees. It might be important to charm them at the beggining of their career. Potential questions to this chart:
Why for employees with 1 previous company worked for attrition rate is way bigger than for employees with 0,2,3,4 companies?
Potential answer: After working for 1 company and now working for us they have found out that it is not a problem in a company but in the fact that this job might not be their thing.
Why attrition rate is smaller for the employees with 8 companies worked for?
This possibly is the moment when people are bored with switching the enviroment often and they might look for more stable life.
Summary of this pages: 
 












  
