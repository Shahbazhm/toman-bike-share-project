/* 
========================================================================
Create New Database 
========================================================================

Script Purpose:
	- This script creates a new database named 'bike_data' after checking if it already exists.
	- If the database exists, it is dropped and recreated. 
	
Warning:
	- Running this script drops the entire 'bike_data' database if it exists.
	- All data in the database will be permanently deleted. 
	- Proceed with caution and ensure that you have proper backups before running this script.
*/


USE master;
GO

--Drop and recreate the 'bike_data' database

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'bike_data')
BEGIN
	ALTER DATABASE bike_data SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE bike_data;
END;
GO

-- Create Database 'bike_data'

CREATE DATABASE bike_data;
GO

USE bike_data;
GO


