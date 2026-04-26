USE Hr_attrition
SELECT * FROM Hr_Attrition 

--Total Number of Employee
SELECT COUNT(*) AS total_employee
FROM Hr_Attrition 

--Attration Rate
SELECT DISTINCT Attrition FROM Hr_Attrition

SELECT COUNT (CASE WHEN Attrition = 1 THEN 1 END )
			 *100.0 / COUNT(*) AS attrition_rate
FROM Hr_Attrition 

--Attrition by Department
SELECT
	Department,
	COUNT(*) AS total_employee,
	COUNT (CASE WHEN Attrition = 1 THEN 1 END ) AS attrition_count_Dept
FROM Hr_Attrition 
GROUP BY Department
ORDER BY attrition_count_Dept DESC

----Attrition by Distance From Home
SELECT 
MIN(DistanceFromHome) AS Min_distance,
MAX(DistanceFromHome) AS Max_distance
FROM Hr_Attrition
SELECT 
	CASE WHEN DistanceFromHome < 10 THEN '1-10'
		  WHEN DistanceFromHome < 20 THEN '11-20'
		  ELSE '20+'
	END  DFM_Group ,
	COUNT(*) AS total_employee,
	SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Attrition_DFM_Group
FROM Hr_Attrition
GROUP BY  CASE WHEN DistanceFromHome < 10 THEN '1-10'
		  WHEN DistanceFromHome < 20 THEN '11-20'
		  ELSE '20+'
	END 

--Attrition by Education
SELECT 
	Education,
	Count(*) AS total_employee,
	COUNT (CASE WHEN Attrition = 1 THEN 1 END ) AS Attrition_edu
FROM Hr_Attrition
GROUP BY Education
ORDER BY Education

--Attrition by EducationField
SELECT
	EducationField,
	COUNT(*) AS total_employee,
	COUNT (CASE WHEN Attrition = 1 THEN 1 END ) AS attrition_count_EduField
FROM Hr_Attrition 
GROUP BY EducationField
ORDER BY attrition_count_EduField DESC

--Attrition by EnviromentSatisfaction
SELECT
	EnvironmentSatisfaction,
	COUNT(*) AS total_employee,
	COUNT (CASE WHEN Attrition = 1 THEN 1 END ) AS attrition_count_Env
FROM Hr_Attrition 
GROUP BY EnvironmentSatisfaction
ORDER BY attrition_count_Env DESC

--Gender Analysis
SELECT 
	Gender,
	Count(*) AS total_employee,
	COUNT (CASE WHEN Attrition = 1 THEN 1 END ) AS Attrition_Gender
FROM Hr_Attrition
GROUP BY Gender

--Attrition by job role
SELECT
	JobRole,
	COUNT(*) AS total_employee,
	COUNT (CASE WHEN Attrition = 1 THEN 1 END ) AS attrition_count_role
FROM Hr_Attrition 
GROUP BY JobRole
ORDER BY attrition_count_role DESC

--Job Satisfaction Impact
SELECT 
	JobSatisfaction,
	Count(*) AS total_employee,
	COUNT (CASE WHEN Attrition = 1 THEN 1 END ) AS Attrition_Satisfaction
FROM Hr_Attrition
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction

--Maritalstaus Impact
SELECT 
	MaritalStatus,
	Count(*) AS total_employee,
	COUNT (CASE WHEN Attrition = 1 THEN 1 END ) AS Attrition_MaritalStatus
FROM Hr_Attrition
GROUP BY MaritalStatus

--Salary Analysis
SELECT
	AVG(MonthlyIncome) AS Avg_salary,
	MIN(MonthlyIncome) AS Min_salary,
	MAX(MonthlyIncome) AS Max_salary
FROM Hr_Attrition

--Salary of people who left vs Salary of people who stayed
SELECT
	Attrition,
	AVG(MonthlyIncome) AS Avg_salary
FROM Hr_Attrition 
GROUP BY Attrition

--Top 5 Highest Paid Employees
SELECT TOP 5 *
FROM Hr_Attrition
ORDER BY MonthlyIncome DESC

--Overtime impact in Attrition
SELECT 
	OverTime,
	Count(*) AS total_employee,
	COUNT (CASE WHEN Attrition = 1 THEN 1 END ) AS Attrition_overtime
FROM Hr_Attrition 
GROUP BY OverTime

--Expirience Analysis
SELECT 
	YearsAtCompany,
	Count(*) AS total_employee,
	COUNT (CASE WHEN Attrition = 1 THEN 1 END ) AS Attrition_Expirience
FROM Hr_Attrition
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany

--Which Age group has most Attrition
SELECT 
	CASE WHEN Age < 25 THEN '18-25'
		  WHEN Age < 35 THEN '26-35'
		  WHEN Age < 45 THEN '36-45'
		  ELSE '45+'
	END  Age_Group ,
	COUNT(*) AS total_employee,
	SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Attrition_Age_Group,
	SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100 / COUNT(*) AS Percent_Attrition_Age_Group
FROM Hr_Attrition
GROUP BY CASE WHEN Age < 25 THEN '18-25'
		  WHEN Age < 35 THEN '26-35'
		  WHEN Age < 45 THEN '36-45'
		  ELSE '45+'
	END 
ORDER BY Percent_Attrition_Age_Group DESC




