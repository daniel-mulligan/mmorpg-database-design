/*
	Author: Daniel Mulligan
	Date: 09/11/2024
	Description: This script is for the purposes of creating a stored procedure that adds the specified amount of time to the specified account.
	File Name: Stored Procedure spAddTime.sql
	Notes:.
*/

USE MMORPG_DB
GO

CREATE PROCEDURE spAddTime
    @username VARCHAR(255),       -- Account name
    @daysToAdd INT                -- Length of time to add in days
AS
BEGIN
    -- Check if the specified account exists
    IF EXISTS (SELECT 1 FROM accounts WHERE username = @username)
    BEGIN
        -- Update the timeRemaining for the account by adding the specified number of days
        UPDATE accounts
        SET daysUntilSubExpiry = daysUntilSubExpiry + @daysToAdd
        WHERE username = @username;

        PRINT 'Time added successfully.';
    END
    ELSE
    BEGIN
        -- Print an error message if the account does not exist
        PRINT 'Error: Account does not exist.';
    END
END;
GO

EXEC spAddTime
	@username = 'danny101',
	@daysToAdd = 10
GO

SELECT * FROM accounts
GO