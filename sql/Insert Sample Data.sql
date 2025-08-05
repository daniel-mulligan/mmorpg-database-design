/*
	Author: Daniel Mulligan
	Date: 27/10/2024
	Description: This script is for the purposes of inserting sample data into the tables of my database.
	File Name: Insert Sample Data.sql
	Notes:.
*/

USE MMORPG_DB
GO

INSERT INTO player VALUES				-- inserting the sample data for  the players table
('Daniel','Mulligan','danmulligan97@gmail.com'),
('Brandon','Browne','brandon@gmail.com'),
('Sandra','Nel','sandi.nel@hotmail.com'),
('John','Whick','jw@johnwhick.com'),
('Tia','Tamera','t.tamera@yahoo.com')
GO

INSERT INTO accounts VALUES				-- inserting the sample data for  the accounts table
(1,'danny101','yesand097','Active',11,'2024-10-15'),
(2,'bbrowne99','teatime77','Active',14,'2024-10-12'),
(3,'sandiraaa','wakamole44','Inactive',0,'2024-09-15'),
(4,'JohnnyJohn','iseeyou#*','Active',22,'2024-11-10'),
(5,'TiaandTamera11','wearetwins11','Inactive',0,'2024-07-08')
GO

INSERT INTO errors VALUES				-- inserting the sample data for  the errors table
(1,'Login Failure','Account not found','09.24.25 21:33:21'),
(2,'Patch Error','Missing Files','07.11.25 10:00:55'),
(3,'Login Failure','Account not found','04.06.25 09:01:05'),
(4,'Load Out Error','Character Not Found','10.05.25 23:34:08'),
(5,'Payment Error','Bad Gateway','11.08.25 11:22:00')
GO

INSERT INTO characters VALUES			-- inserting the sample data for  the characters table
(1,'Megalin',8,'Sun Team'),
(2,'Beor',6,'Moon Team'),
(3,'Toga',2,'Moon Team'),
(4,'Falin',2,'Sun Team'),
(5,'Trimore',6,'Moon Team')
GO

INSERT INTO items VALUES				-- inserting the sample data for  the items table
('Sun Sword','AT +10, SP +1'),
('Sun Sword','AT +10, SP +1'),
('Earth Sheild','DEF +20'),
('OT Healing Potion','HP +50'),
('Special Mana Potion','MP +20, SP +20')
GO

INSERT INTO character_inventory VALUES	-- inserting the sample data for  the character inventory table
(1,1,1,1),
(2,2,1,2),
(3,3,4,1),
(4,4,6,6),
(5,5,8,12)
GO

SELECT * FROM player -- select statements to show the tables with the new data
SELECT * FROM accounts
SELECT * FROM errors
SELECT * FROM characters
SELECT * FROM items
SELECT * FROM character_inventory
GO