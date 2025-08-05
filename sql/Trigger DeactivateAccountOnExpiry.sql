/*
	Author: Daniel Mulligan
	Date: 11/11/2024
	Description: This script is for the purposes of creating a trigger that deactivates an account when the days until sub expiry is updated to 0.
	File Name: Trigger DeactivateAccountOnExpiry.sql
	Notes:.
*/

USE MMORPG_DB;
GO

CREATE TRIGGER trg_DeactivateAccountOnExpiry
ON accounts
AFTER UPDATE -- make sure the trigger only happens after the value of days until sub expiry is updated
AS
BEGIN
    UPDATE accounts -- Update accStatus to 'Inactive' when daysUntilSubExpiry is zero
    SET accStatus = 'Inactive'
    WHERE daysUntilSubExpiry = 0
      AND accStatus = 'Active' -- prevent accounts that are already inactive from being re-processed
      AND accID IN (SELECT accID FROM inserted); --  limits the update to only those accIDs that were recently modified.
END;
GO