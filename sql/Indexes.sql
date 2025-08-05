/*
	Author: Daniel Mulligan
	Date: 11/11/2024
	Description: This script is for the purposes of creating the Indexes for the Foreign keys in the database to make joining tables faster.
	File Name: Indexes.sql
	Notes:.
*/

USE MMORPG_DB;
GO


CREATE NONCLUSTERED INDEX IX_Accounts_PlayerID ON accounts(playerID); -- Adding an index on the foreign key in `accounts` referencing `player`.

CREATE NONCLUSTERED INDEX IX_Errors_AccID ON errors(accID); -- Adding an index on the foreign key in `errors` referencing `accounts`.

CREATE NONCLUSTERED INDEX IX_Characters_AccID ON characters(accID); -- Adding an index on the foreign key in `characters` referencing `accounts`.

CREATE NONCLUSTERED INDEX IX_CharacterInventory_CharID ON character_inventory(charID);-- Adding an index on `character_inventory` for the foreign keys.
CREATE NONCLUSTERED INDEX IX_CharacterInventory_ItemID ON character_inventory(itemID);

GO