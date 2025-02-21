-- To run stored procedure trigger 'EXEC silver.load_silver'

CREATE OR ALTER PROCEDURE silver.load_silver AS

TRUNCATE TABLE silver.employee_info;

INSERT INTO silver.employee_info (
    EmployeeID,
    FirstName,
    LastName,
    Department,
    HireDate,
    Salary,
    E_Status,
    MP_Created_at
)
SELECT 
    EmployeeID,
    FirstName,
    LastName,
    Department,
    HireDate,
    Salary,
    E_Status,
    GETDATE()  -- Auto-fills created_at with the current timestamp
FROM bronze.employee_info;

GO

TRUNCATE TABLE silver.performance;

INSERT INTO silver.performance (
    EmployeeID,
    Quarter_No,
    PerformanceScore,
    CompletedProjects,
    OverdueTasks,
    MP_Created_at
)
SELECT 
    EmployeeID,
    Quarter_No,
    PerformanceScore,
    CompletedProjects,
    OverdueTasks,
    GETDATE()  -- Auto-fills created_at with the current timestamp
FROM bronze.performance;

GO

INSERT INTO silver.resource_utilization (
    EmployeeID,			
	Department,			
	SystemUsageHours,
	ProductivityScore,
    MP_Created_at
)
SELECT 
	EmployeeID,			
	Department,			
	SystemUsageHours,
	ProductivityScore,
    GETDATE()  -- Auto-fills created_at with the current timestamp
FROM bronze.resource_utilization;

GO

INSERT INTO silver.time_logs (
    LogID,
	EmployeeID,
	ProjectID,
	EntryDate,
	HourWorked,
    MP_Created_at
)
SELECT 
	LogID,
	EmployeeID,
	ProjectID,
	EntryDate,
	HourWorked,
    GETDATE()  -- Auto-fills created_at with the current timestamp
FROM bronze.time_logs;
