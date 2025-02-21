
IF OBJECT_ID('silver.employee_info', 'U') IS NOT NULL
	DROP TABLE silver.employee_info;

	GO

Create table silver.employee_info(

	EmployeeID		INT,
	FirstName		NVARCHAR(50),
	LastName		NVARCHAR(50),
	Department		NVARCHAR(50),
	HireDate		DATE,
	Salary			INT,
	E_Status		NVARCHAR(50),
	MP_Created_at	DATETIME DEFAULT GETDATE()
	);
	GO
	 
	 IF OBJECT_ID('silver.time_logs', 'U') IS NOT NULL
	DROP TABLE silver.time_logs;

	GO

	Create table silver.time_logs(

	LogID			INT,
	EmployeeID		INT,
	ProjectID		INT,
	EntryDate		DATE,
	HourWorked		INT,
	MP_Created_at	DATETIME DEFAULT GETDATE()
	
	);

	GO
	 
	 IF OBJECT_ID('silver.performance', 'U') IS NOT NULL
	DROP TABLE silver.performance;

	GO

	Create table silver.performance(

	EmployeeID			INT,
	Quarter_No			NVARCHAR(50),
	PerformanceScore	NVARCHAR(50),
	CompletedProjects	INT,
	OverdueTasks		INT,
	MP_Created_at		DATETIME DEFAULT GETDATE()
	
	);
		GO
	 
	 IF OBJECT_ID('silver.resource_utilization', 'U') IS NOT NULL
	DROP TABLE silver.resource_utilization;

	GO

	Create table silver.resource_utilization(

	EmployeeID			INT,
	Department			NVARCHAR(50),
	SystemUsageHours	FLOAT,
	ProductivityScore	FLOAT,
	MP_Created_at		DATETIME DEFAULT GETDATE()
	)