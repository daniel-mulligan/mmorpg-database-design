/*
	Author: Daniel Mulligan
	Date: 09/11/2024
	Description: This script is for the purposes of creating a stored procedure that adds a specified character to a specified account.
	File Name: Stored Procedure spAddChar.sql
	Notes:.
*/


USE MMORPG_DB
GO

CREATE PROCEDURE spAddChar
    @accID INT,                 -- parameter for account ID to which the character will be added
    @charName VARCHAR(255),     -- parameter for name of the new character
	@team VARCHAR(255),			-- parameter for team of the new character
    @initialSkillLevel INT = 1  -- parameter for initial skill level of the character, default to 1
AS
BEGIN
    -- Check if the specified account exists
    IF NOT EXISTS (SELECT 1 FROM accounts WHERE accID = @accID)
    BEGIN
        PRINT 'Error: Account does not exist.';
        RETURN;
    END

    -- Check if the character name is already taken within the account
    IF EXISTS (SELECT 1 FROM characters WHERE accID = @accID AND charName = @charName)
    BEGIN
        PRINT 'Error: Character name already exists for this account.';
        RETURN;
    END
	 -- Check if the character team is one of the two possible teams
	IF @team NOT IN ('Sun Team', 'Moon Team')
	BEGIN
		PRINT 'Error: Character may only belong to the Sun Team or Moon Team.';
        RETURN;
    END

    -- Add the new character to the characters table
    INSERT INTO characters (charName, accID, skillLevel, team)
    VALUES (@charName, @accID, @initialSkillLevel, @team);

    PRINT 'Character added successfully.';
END;
GO

EXEC spAddChar -- execute the procedure
	@accID = 2,
	@charName = 'Eric',
	@team = 'Sun Team'
GO

SELECT * FROM characters -- check if the character was added
GO