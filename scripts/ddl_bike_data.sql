/*
=============================================================
DDL Script: Create Database Tables
=============================================================
Script Purpose:
This script creates tables in the 'bike_data' databaae, dropping
existing tables if they already exist.

Run this script to re-define the DDL structure of the 'bike_data' 
tables.
=============================================================
*/

IF OBJECT_ID ('dbo.bike_share_yr_0', 'U') IS NOT NULL
	DROP TABLE dbo.bike_share_yr_0;
	
CREATE TABLE dbo.bike_share_yr_0 (
	dteday 		nvarchar (50) NOT NULL,
	season 		nvarchar (50) NOT NULL,
	yr 			nvarchar (50) NOT NULL,
	mnth 		nvarchar (50) NOT NULL,
	hr 			nvarchar (50) NOT NULL,
	holiday 	nvarchar (50) NOT NULL,
	weekday 	nvarchar (50) NOT NULL,
	workingday 	nvarchar (50) NOT NULL,
	weathersit 	nvarchar (50) NOT NULL,
	temp 		float 		  NOT NULL,
	atemp 		float 		  NOT NULL,
	hum 		nvarchar (50) NOT NULL,
	windspeed 	nvarchar (50) NOT NULL,
	rider_type 	nvarchar (50) NOT NULL,
	riders nvarchar      (50) NOT NULL
); 
GO	

IF OBJECT_ID ('dbo.bike_share_yr_1', 'U') IS NOT NULL
	DROP TABLE dbo.bike_share_yr_1;
	
CREATE TABLE dbo.bike_share_yr_1 (
	dteday 		nvarchar (50) NOT NULL,
	season 		nvarchar (50) NOT NULL,
	yr 			nvarchar (50) NOT NULL,
	mnth 		nvarchar (50) NOT NULL,
	hr 			nvarchar (50) NOT NULL,
	holiday 	nvarchar (50) NOT NULL,
	weekday 	nvarchar (50) NOT NULL,
	workingday 	nvarchar (50) NOT NULL,
	weathersit 	nvarchar (50) NOT NULL,
	temp 		float 		  NOT NULL,
	atemp 		float 		  NOT NULL,
	hum 		nvarchar (50) NOT NULL,
	windspeed 	nvarchar (50) NOT NULL,
	rider_type 	nvarchar (50) NOT NULL,
	riders nvarchar      (50) NOT NULL
); 
GO	

IF OBJECT_ID ('dbo.cost_table', 'U') IS NOT NULL
	DROP TABLE dbo.cost_table;
	
CREATE TABLE dbo.cost_table (
	yr 			nvarchar (50) NOT NULL,
	price 		float 		  NOT NULL,
	COGS 		float 		  NOT NULL
); 
GO		
	
	
	
