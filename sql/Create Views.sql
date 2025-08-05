/*
	Author: Daniel Mulligan
	Date: 27/10/2024
	Description: This script is for the purposes of creating various views fro the database.
	File Name: Create Views.sql
	Notes:.
*/

USE MMORPG_DB
GO

CREATE VIEW vwBlockedAccounts -- creating th view for blocked accounts
AS
	SELECT accID, username, accStatus  -- selecting the columns to view
	FROM accounts
	WHERE accStatus = 'Inactive' -- checking against the WHERE clause to find inactive accounts
GO

CREATE VIEW vwTopSkill -- creating the view for top 20 skilled characters
AS SELECT TOP 20		-- selecting the columns to view
	characters.charID,
	characters.charName,
	characters.skillLevel,
	accounts.accID,
	accounts.username
FROM 
	dbo.characters
JOIN						-- joining the characters and accounts table for the view
	accounts ON characters.accID = accounts.accID
ORDER BY					-- ordering the view by the characters skill level in descending order.
	characters.skillLevel DESC;
GO

CREATE VIEW vwTopStackedItems -- creating the view to select the top 20 stacked items
AS SELECT TOP 20		-- selecting the columns to view
	items.itemName,
	character_inventory.itemID,
	character_inventory.quanity,
	characters.charName
FROM
	dbo.character_inventory
JOIN								-- joining the character inventory and items tables
	items ON character_inventory.itemID = items.itemID
JOIN								-- joining the charcater inventory and characters tables
	characters ON character_inventory.charID = characters.charID
ORDER BY							-- ordering by the quanity in the characters inventory in descending order
	character_inventory.quanity DESC
GO

CREATE VIEW vwPopItems -- creating the view for the top 5 most popular items found in characters inventories
AS SELECT TOP 5 -- selecting the column item name in the items table
	itemName,
	COUNT(itemName) AS noCharacters -- counting the instances of the item names in items table
FROM
	items
GROUP BY		-- grouping by the item names
	itemName
ORDER BY		-- ordering the view by the count of the same names found in the table in descending order
	noCharacters DESC
GO
		
SELECT * FROM vwBlockedAccounts -- using select statements to show views
SELECT * FROM vwTopSkill
SELECT * FROM vwTopStackedItems
SELECT * FROM vwPopItems
GO
