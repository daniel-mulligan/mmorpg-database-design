# 🧾 Data Entry Guidelines

This document outlines the expected data types, formats, and constraints for each table in the MMORPG database system. These guidelines ensure that the system functions correctly when entering new records or executing stored procedures.

---

## 👤 Player Table

| Column Name       | Type      | Constraints                    | Description                                |
|-------------------|-----------|--------------------------------|--------------------------------------------|
| `playerID`        | `INT`     | Not Null, Identity, PK         | Auto-incremented primary key               |
| `playerFirstName` | `VARCHAR` | Max 255 chars, Not Null        | Player’s first name                        |
| `playerLastName`  | `VARCHAR` | Max 255 chars, Not Null        | Player’s last name                         |
| `playerEmail`     | `VARCHAR` | Max 255 chars, Not Null        | Player’s valid email address               |

---

## 🧾 Accounts Table

| Column Name           | Type      | Constraints                         | Description                                    |
|------------------------|-----------|--------------------------------------|------------------------------------------------|
| `accID`               | `INT`     | Not Null, Identity, PK               | Unique account ID                              |
| `playerID`            | `INT`     | Not Null, FK                         | Foreign key to Player                          |
| `username`            | `VARCHAR` | Max 255 chars, Not Null, Unique      | Account login name                             |
| `password`            | `VARCHAR` | Max 255 chars, Not Null              | Account password                               |
| `accStatus`           | `VARCHAR` | Max 10 chars, Only `Active`/`Inactive` | Current subscription status                    |
| `daysUntilSubExpiry`  | `INT`     | Not Null                             | Days left before subscription expires          |
| `lastPayment`         | `DATE`    | Format: `YYYY-MM-DD`                 | Date of last payment                           |

---

## 🚨 Errors Table

| Column Name      | Type        | Constraints              | Description                               |
|------------------|-------------|---------------------------|-------------------------------------------|
| `errorID`        | `INT`       | Not Null, Identity, PK    | Unique error log ID                       |
| `accID`          | `INT`       | Not Null, FK              | Related account ID                        |
| `errorType`      | `VARCHAR`   | Max 255 chars, Not Null   | Type of error                             |
| `errorDesc`      | `VARCHAR`   | Max 255 chars, Not Null   | Description of the error                  |
| `errorTimeStamp` | `DATETIME`  | Format: `MM.DD.YYYY HH:MM:SS` | When the error occurred              |

---

## 🧙 Characters Table

| Column Name   | Type      | Constraints                      | Description                              |
|---------------|-----------|-----------------------------------|------------------------------------------|
| `charID`      | `INT`     | Not Null, Identity, PK            | Unique character ID                      |
| `charName`    | `VARCHAR` | Max 255 chars, Not Null           | Character name                           |
| `skillLevel`  | `INT`     | Not Null, Max 8                   | Level from 1–8                           |
| `team`        | `VARCHAR` | Max 10 chars, Not Null, Must be `Sun Team` or `Moon Team` | Character’s team         |

---

## 🧰 Items Table

| Column Name   | Type      | Constraints                | Description                              |
|---------------|-----------|-----------------------------|------------------------------------------|
| `itemID`      | `INT`     | Not Null, Identity, PK      | Unique item ID                           |
| `itemName`    | `VARCHAR` | Max 255 chars, Not Null     | Name of the item                         |
| `itemDetails` | `VARCHAR` | Max 255 chars, Not Null     | Description or effect of the item        |

---

## 🎒 Character Inventory Table

| Column Name | Type  | Constraints                                   | Description                                          |
|-------------|-------|------------------------------------------------|------------------------------------------------------|
| `charID`    | `INT` | PK, FK                                         | Linked character                                     |
| `itemID`    | `INT` | PK, FK                                         | Linked item                                          |
| `slotNum`   | `INT` | Not Null, Max 8, Unique per character         | Inventory slot number (1–8)                          |
| `quantity`  | `INT` | Not Null                                       | Number of this item in that slot                    |

> ⚠️ A character cannot use the same `slotNum` twice.

---

## 📎 Usage Notes

- This structure supports extensible game systems.
- All inputs should be validated before inserting data.
- Use the stored procedures provided for structured interaction.

---
