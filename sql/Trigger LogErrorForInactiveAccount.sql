/*
	Author: Daniel Mulligan
	Date: 11/11/2024
	Description: This script is for the purposes of creating a trigger that logs an error for a deactivated account if a character is added or updated.
	File Name: Trigger LogErrorForInactiveAccount.sql
	Notes:.
*/

USE MMORPG_DB;
GO

CREATE TRIGGER trg_LogErrorForInactiveAccount
ON characters
AFTER INSERT, UPDATE	--make sure the trigger only happens after the value of days until sub expiry is updated
AS
BEGIN
	INSERT INTO errors (accID, errorType, errorDesc, errorTimeStamp)
	SELECT 
		inserted.accID,		-- using the inserted table to get the account ID for the inactive account
		'Unauthorized Action',
		'Inactive account attempted to add/update character.',
		GETDATE()		-- gets the current date
	FROM 
		inserted
	JOIN			-- joining the intereted table to the accounts table
		accounts ON inserted.accID = accounts.accID
	WHERE 
		accounts.accStatus = 'Inactive'; -- finding the inactive accounts
END;
GO