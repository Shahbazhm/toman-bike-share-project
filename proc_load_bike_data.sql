/*
==================================================================
Stored Prcedure: Load Database Tables (Source -> bike_data)
==================================================================
Script Purpose:
This stored procedure loads data into the 'bike_data' database from CSV
files.
It performs the following actions:
- Truncate the existing tables before loading data.
- Use 'BULK INSERT' command to load data from CSV files to 'bike_data' 
tables.

Paramaters:
None.
This stored procedure does not accept any parameters or RETURN
any values.

Usage Example: EXEC dbo.load_bike_data;
*/

CREATE OR ALTER PROCEDURE dbo.load_bike_data AS

BEGIN

	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;	

	BEGIN TRY
	
		SET @batch_start_time = GETDATE ();
	
		PRINT '----------------------------------------';
		PRINT 'Loading bike_data Tables';
		PRINT '----------------------------------------';
		
		SET @start_time = GETDATE ();
		
		PRINT '>> Truncating Table: dbo.bike_share_yr_0';	
		TRUNCATE TABLE dbo.bike_share_yr_0;
		
		PRINT '>> Insering Data Into: dbo.bike_share_yr_0';
		BULK INSERT dbo.bike_share_yr_0
		FROM 'C:\Users\shahb\Downloads\END TO END PORTFOLIO PROJECTS\Toman Bike Share Dashboard\data\bike_share_yr_0.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		
		SET @end_time = GETDATE ();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' Seconds';
		PRINT '-------------';
		
		SET @start_time = GETDATE ();
		
		PRINT '>> Truncating Table: dbo.bike_share_yr_1';	
		TRUNCATE TABLE dbo.bike_share_yr_1;
		
		PRINT '>> Insering Data Into: dbo.bike_share_yr_1';
		BULK INSERT dbo.bike_share_yr_1
		FROM 'C:\Users\shahb\Downloads\END TO END PORTFOLIO PROJECTS\Toman Bike Share Dashboard\data\bike_share_yr_1.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		
		SET @end_time = GETDATE ();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' Seconds';
		PRINT '-------------';
		
		
		SET @start_time = GETDATE ();
		
		PRINT '>> Truncating Table: dbo.cost_table';	
		TRUNCATE TABLE dbo.cost_table;
		
		PRINT '>> Insering Data Into: dbo.cost_table';
		BULK INSERT dbo.cost_table
		FROM 'C:\Users\shahb\Downloads\END TO END PORTFOLIO PROJECTS\Toman Bike Share Dashboard\data\cost_table.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		
		SET @end_time = GETDATE ();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' Seconds';
		PRINT '-------------';		
			
		SET @batch_end_time = GETDATE ();
		PRINT '========================================';
		PRINT 'Loading bike_data Tables is Completed';
		PRINT '  - Total Duration: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' Seconds';
		PRINT '========================================';
		
	END TRY
	
	BEGIN CATCH
    PRINT '========================================';
    PRINT 'ERROR OCCURED DURING LOADING bike_data TABLES';
    PRINT ERROR_MESSAGE();
    PRINT CAST(ERROR_NUMBER() AS NVARCHAR);
    PRINT CAST(ERROR_STATE() AS NVARCHAR);
    PRINT '========================================';
END CATCH

END