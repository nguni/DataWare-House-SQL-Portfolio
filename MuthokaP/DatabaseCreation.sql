USE master

-- Drop and recreate the 'MuthokaP' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'MuthokaP')
BEGIN
    ALTER DATABASE MuthokaP SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE MuthokaP;
END;


CREATE DATABASE MuthokaP
GO

USE MuthokaP
Go
Create SCHEMA bronze
Go
Create SCHEMA silver
Go
Create SCHEMA gold