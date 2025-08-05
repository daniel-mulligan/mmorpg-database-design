/*
	Author: Daniel Mulligan
	Date: 09/11/2024
	Description: This script is for the purposes of creating a stored procedure that Registers a new account.
	File Name: Stored Procedure spRegister.sql
	Notes:.
*/

USE MMORPG_DB
GO

CREATE PROCEDURE spRegister
	@firstName VARCHAR (255),	-- Parameter for First Name
	@lastName VARCHAR (255),	-- Parameter for Last Name
    @username VARCHAR(255),		-- Parameter for username
    @email VARCHAR(255),		-- Parameter for email
    @password VARCHAR(255)		-- Parameter for password
AS
BEGIN
    -- Check if the username already exists in the table
    IF EXISTS (SELECT 1 FROM accounts WHERE username = @username)
    BEGIN
        -- Return an error message if the username already exists
        PRINT 'Error: Username already exists.';
	END
    ELSE
    BEGIN
        -- Insert a new account into the accounts table and player table emsuring the player ID is declared.
		INSERT INTO player (playerFirstName,playerLastName,playerEmail)
		VALUES (@firstName, @lastName, @email);
  
		DECLARE @playerID INT;
			SET @playerID = SCOPE_IDENTITY();

		INSERT INTO accounts (playerID, username, password)
        VALUES (@playerID, @username, @password);
		PRINT 'Account registered successfully.';
	END
END;
GO

EXEC spRegister -- example entry of the procedure.
	@firstName = 'Jefry',
	@lastName = 'Miles',
	@email = 'jeff.miles@gmail.com',
	@username = 'jm2022',
	@password = 'password'
GO


SELECT * FROM accounts -- example select statement to confirm it has been added correctly.
JOIN player on player.playerID =accounts.playerID
GO

