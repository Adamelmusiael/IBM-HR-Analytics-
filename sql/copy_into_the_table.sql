COPY ibm_table(Age, Attrition, BusinessTravel, DailyRate, Department, DistanceFromHome, Education, EducationField, EmployeeCount, EmployeeNumber, EnvironmentSatisfaction, Gender, HourlyRate, JobInvolvement, JobLevel, JobRole, JobSatisfaction, MaritalStatus, MonthlyIncome, MonthlyRate, NumCompaniesWorked, Over18, OverTime, PercentSalaryHike, PerformanceRating, RelationshipSatisfaction, StandardHours, StockOptionLevel, TotalWorkingYears, TrainingTimesLastYear, WorkLifeBalance, YearsAtCompany, YearsInCurrentRole, YearsSinceLastPromotion, YearsWithCurrManager)
FROM 'C:\\Users\\Adam\\Desktop\\main\\programming\\Data An EN\\projects\\IBM HR Employee Atttition\\data\\WA_Fn-UseC_-HR-Employee-Attrition.csv'
DELIMITER ','
CSV HEADER;

SELECT *
FROM ibm_table