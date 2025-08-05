/*
	Author: Daniel Mulligan
	Date: 09/11/2024
	Description: This script is for the purposes of creating a stored procedure that prints out a letter for each account, 
	indicating how much time they have left and optionally send out the latest news.
	File Name: Stored Procedure spSendLetter.sql
	Notes:.
*/

USE MMORPG_DB
GO

CREATE PROCEDURE spSendLetter
    @accID INT,                          -- Account ID for which to send the letter
    @newsMessage VARCHAR(MAX) = NULL      -- Optional parameter for the latest news
AS
BEGIN
    DECLARE @accountName VARCHAR(255);
    DECLARE @daysUntilSubExpiry INT;

    -- Check if the account exists
    IF NOT EXISTS (SELECT 1 FROM accounts WHERE accID = @accID)
    BEGIN
        PRINT 'Error: Account does not exist.';
        RETURN;
    END

    -- Retrieve the account name and time left
    SELECT 
        @accountName = username, 
        @daysUntilSubExpiry = daysUntilSubExpiry
    FROM accounts
    WHERE accID = @accID;

    -- Print the letter for the account
    PRINT '--- Letter for Account: ' + @accountName + ' ---';
    PRINT 'Hello ' + @accountName + ',';
    PRINT 'You have ' + CAST(@daysUntilSubExpiry AS VARCHAR) + ' days left in your account.';

    -- If a news message is provided, include it in the letter
    IF @newsMessage IS NOT NULL
    BEGIN
        PRINT '--- Latest News ---';
        PRINT @newsMessage;
    END

    PRINT 'Thank you for playing!';
    PRINT '---------------------------------';
END;
GO

EXEC spSendLetter -- execute the procedure
	@accID = 2, 
	@newsMessage = 'There will be maintanance on the server on January 2nd at 9am EST. Thank you for your patience.'
GO