IF OBJECT_ID('gold.fact_employee', 'V') IS NOT NULL
    DROP VIEW gold.fact_employee;
GO

CREATE VIEW gold.fact_employee AS 
SELECT 
    em.EmployeeID,
    em.FirstName,
    em.LastName,
    em.Department,
    em.HireDate,
    em. Salary,
    em.E_Status,
	AVG(pe.PerformanceScore) as Avg_performance

	FROM silver.employee_info em
	LEFT JOIN silver.performance pe
	ON em.EmployeeID = pe.EmployeeID
	GROUP BY 
    em.EmployeeID, 
    em.FirstName, 
    em.LastName, 
    em.Department, 
    em.HireDate, 
    em.Salary, 
    em.E_Status;
	
	GO

	IF OBJECT_ID('gold.dim_performance', 'V') IS NOT NULL
    DROP VIEW gold.dim_performance;
GO

CREATE VIEW gold.dim_performance AS 
SELECT 
    EmployeeID,
    Quarter_No,
    PerformanceScore,
    CompletedProjects,
    OverdueTasks

	FROM silver.performance
	
	GO

	
	IF OBJECT_ID('gold.dim_time_logs', 'V') IS NOT NULL
    DROP VIEW gold.dim_time_logs;
GO

CREATE VIEW gold.dim_time_logs AS 
SELECT 
    tl.EmployeeID,
    tl.LogID,
    tl.ProjectID,
    tl.EntryDate,
    tl.HourWorked,
    ru.Department,
    AVG(ru.SystemUsageHours) AS Avg_Usage_Hours
FROM silver.time_logs tl
LEFT JOIN silver.resource_utilization ru 
    ON tl.EmployeeID = ru.EmployeeID
GROUP BY 
    tl.EmployeeID,
    tl.LogID,
    tl.ProjectID,
    tl.EntryDate,
    tl.HourWorked,
    ru.Department;
