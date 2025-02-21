
IF OBJECT_ID('bronze.employee_info', 'U') IS NOT NULL
	DROP TABLE bronze.employee_info;

	GO

Create table bronze.employee_info(

	EmployeeID  INT,
	FirstName	NVARCHAR(50),
	LastName	NVARCHAR(50),
	Department	NVARCHAR(50),
	HireDate	DATE,
	Salary		INT,
	E_Status	NVARCHAR(50)		
	);
	GO
	 
	 IF OBJECT_ID('bronze.time_logs', 'U') IS NOT NULL
	DROP TABLE bronze.time_logs;

	GO

	Create table bronze.time_logs(

	LogID		INT,
	EmployeeID  INT,
	ProjectID	INT,
	EntryDate	DATE,
	HourWorked		INT
	
	);

	GO
	 
	 IF OBJECT_ID('bronze.performance', 'U') IS NOT NULL
	DROP TABLE bronze.performance;

	GO

	Create table bronze.performance(

	EmployeeID			INT,
	Quarter_No			NVARCHAR(50),
	PerformanceScore	NVARCHAR(50),
	CompletedProjects	INT,
	OverdueTasks		INT
	
	);
		GO
	 
	 IF OBJECT_ID('bronze.resource_utilization', 'U') IS NOT NULL
	DROP TABLE bronze.resource_utilization;

	GO

	Create table bronze.resource_utilization(

	EmployeeID			INT,
	Department			NVARCHAR(50),
	SystemUsageHours	FLOAT,
	ProductivityScore	FLOAT
	)