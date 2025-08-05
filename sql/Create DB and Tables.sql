/*
	Author: Daniel Mulligan
	Date: 27/10/2024
	Description: This script is for the purposes of creating the Database and the nessecary tables.
	File Name: Create DB and Tables.sql
	Notes: Please ensure you change the file path on your device before excecuting.
*/

USE master
GO

CREATE DATABASE MMORPG_DB -- A database name MMORPG_DB is created.
ON PRIMARY
(
	NAME = 'MMORPG_DB_data',
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MMORPG_DB_data.mdf', -- Reminder to change file path.
	SIZE = 10MB,
	FILEGROWTH = 10%
)

LOG ON
(
	NAME = 'MMORPG_DB_log',
	FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MMORPG_DB_log.ldf', -- Reminder to change file path.
	SIZE = 10MB,
	FILEGROWTH = 10%
)
GO

USE MMORPG_DB
GO

CREATE TABLE player -- created the player table.
(
	playerID INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	playerFirstName VARCHAR (255) NOT NULL,
	playerLastName VARCHAR (255) NOT NULL,
	playerEmail VARCHAR (255) NOT NULL	
)
GO

CREATE TABLE accounts -- created the accounts table.
(
	accID INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	playerID INT NOT NULL REFERENCES player(playerID), -- referencing a foreign key from the player table.
	username VARCHAR (255) NOT NULL UNIQUE,
	password VARCHAR (255) NOT NULL,
	accStatus VARCHAR(10),
    CHECK (accStatus IN ('Active', 'Inactive')), -- used a check to only allow these values into the accStatus column.
	daysUntilSubExpiry INT,
	lastPayment DATE 
)
GO

CREATE TABLE errors -- created the errors table.
(
	errorID INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	accID INT NOT NULL REFERENCES accounts(accID), -- referencing a foreign key from the accounts table.
	errorType VARCHAR (255) NOT NULL,
	errorDesc VARCHAR (255) NOT NULL,
	errorTimeStamp DATETIME NOT NULL
)
GO

CREATE TABLE characters -- created the characters table.
(
	charID INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	accID INT NOT NULL REFERENCES accounts(accID), -- referencing a foreign key from the accounts table.
	charName VARCHAR (255) NOT NULL,
	skillLevel INT NOT NULL,
	CHECK (skillLevel <= 8), -- used a check to only allow these values into the skillLevel column.
	team VARCHAR (10) NOT NULL,
	CHECK (team in ('Sun Team', 'Moon Team')) -- used a check to only allow these values into the team column.
)
GO

CREATE TABLE items -- created the items table.
(
	itemID INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	itemName VARCHAR (255) NOT NULL,
	itemDetails VARCHAR (255) NOT NULL	
)
GO

CREATE TABLE character_inventory -- created the character_inventory table.
(
	charID INT NOT NULL REFERENCES characters(charID), -- referencing a foreign key from the character table.
	itemID INT NOT NULL REFERENCES items(itemID), -- referencing a foreign key from the items table.
	PRIMARY KEY (charID, itemID), -- created a composite primary key ina seperate row to combine the two foreign keys referenced above.
	slotNum INT NOT NULL,
	CHECK (slotNum <= 8), -- used a check to only allow these values into the slotNum column.
	CONSTRAINT UQ_Inventory_CharID_Slot UNIQUE (charID, slotNum), -- used a constraint to allow only unique value for the slot numbers ofr each character.
	quanity INT NOT NULL,
)
GO