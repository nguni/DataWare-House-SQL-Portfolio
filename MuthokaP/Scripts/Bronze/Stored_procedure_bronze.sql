
-- To execute stored procedure trigger 'EXEC bronze.load_bronze' 


CREATE OR ALTER PROCEDURE bronze.load_bronze AS    

TRUNCATE TABLE bronze.employee_info;

BULK INSERT bronze.employee_info
FROM 'C:\Users\JohnMuthoka\Documents\John Project Port\MuthokaP\Dataset\employee.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

GO

TRUNCATE TABLE bronze.time_logs;
BULK INSERT bronze.time_logs
FROM 'C:\Users\JohnMuthoka\Documents\John Project Port\MuthokaP\Dataset\time.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

GO 

TRUNCATE TABLE bronze.performance;
BULK INSERT bronze.performance
FROM 'C:\Users\JohnMuthoka\Documents\John Project Port\MuthokaP\Dataset\performance.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

GO 

TRUNCATE TABLE bronze.resource_utilization;
BULK INSERT bronze.resource_utilization
FROM 'C:\Users\JohnMuthoka\Documents\John Project Port\MuthokaP\Dataset\resourceutilization.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);