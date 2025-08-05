/*
	Author: Daniel Mulligan
	Date: 09/11/2024
	Description: This script is for the purposes of creating a stored procedure that adds an item to a character’s inventory.
	File Name: Stored Procedure spAddItem.sql
	Notes:.
*/


USE MMORPG_DB
GO

CREATE PROCEDURE spAddItem
    @charID INT,				-- Character ID    
	@itemName Varchar (255),	-- Item ID to be added
	@slotNum INT,				-- parameter for slot number the item will be added to
	@quantity INT,				-- parameter for the quanity of items to be added
	@itemDetails Varchar(255)	-- parameter for the items description
AS
BEGIN
    -- Check if the character exists
    IF NOT EXISTS (SELECT 1 FROM characters WHERE charID = @charID)
    BEGIN
        PRINT 'Error: Character does not exist.';
        RETURN;
    END

    -- Define the maximum inventory slots per character
    DECLARE @maxInventorySlots INT = 8;

    -- Check if there is space in the character's inventory
    DECLARE @currentInventoryCount INT;
    SET @currentInventoryCount = (SELECT COUNT(*) FROM character_inventory WHERE charID = @charID);

    IF @currentInventoryCount >= @maxInventorySlots
    BEGIN
        PRINT 'Error: No space available in inventory.';
        RETURN;
    END

	IF EXISTS (SELECT 1 FROM character_inventory WHERE charID = @charID AND slotNum = @slotNum)
    BEGIN
        PRINT 'Error: The specified inventory slot is already occupied.';
        RETURN;
    END

    -- Add the item to the items table and character's inventory
    INSERT INTO items(itemName,itemDetails)
	VALUES (@itemName, @itemDetails)

	DECLARE @itemID INT;
			SET @itemID = SCOPE_IDENTITY();

	INSERT INTO character_inventory(charID, itemID, slotNum, quanity)
    VALUES (@charID, @itemID, @slotNum, @quantity);
	
    PRINT 'Item added to inventory successfully.';
END;
GO

EXEC spAddItem  -- example entry of the procedure
	@charID = 1,
	@itemName = 'Moon Lance',
	@slotNum = 3,
	@quantity = 2,
	@itemDetails = 'ST +3'
GO

SELECT * FROM character_inventory -- example select statement to confirm it has been added correctly.
JOIN items on items.itemID = character_inventory.itemID
GO

