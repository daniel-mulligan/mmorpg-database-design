# 🗃️ MMORPG Database System (Design + Implementation)

**Author:** Daniel Mulligan  
**Module:** Database Management & Design  
**Lecturer:** Mahomed Hoosen Goolam Nabee  
**Campus:** Eduvos – Tyger Valley  
**Date:** October 2024  

---

## 📘 Overview

This project presents the full design and implementation of a relational database system for a fictional **Massively Multiplayer Online Role-Playing Game (MMORPG)**. The system manages player accounts, characters, inventory, error logging, and subscription tracking.

The project is divided into two core phases:
1. **Design Phase** – Conceptual modeling and normalization to 3NF.
2. **Implementation Phase** – Full SQL database build in MS SQL Server using DDL, triggers, views, and stored procedures.

---

## 🧠 Phase 1: Database Design & Normalization

The design process followed a structured normalization flow from unstructured data to fully normalized relational models.

🔹 [Normalization Process Documentation](docs/normalization-process.md)  
🔹 [Final Normalized Tables & Structure](docs/final-tables.md)  
🔹 [ER Diagram](docs/erd.png)

### 📂 Related Files

- `docs/normalization-process.md` – Detailed breakdown of 0NF → 3NF  
- `images/` – Visual diagrams for each normalization step  
- `docs/final-tables.md` – Table structure, sample data, and constraints

---

## ⚙️ Phase 2: SQL Implementation

The database was implemented using **MS SQL Server Management Studio (SSMS)** with multiple SQL scripts and stored procedures.

### 🧾 Included Scripts (in `sql/` folder)

| File Name | Description |
|-----------|-------------|
| `01_create-db-and-tables.sql` | Creates the database and table structures |
| `02_insert-sample-data.sql` | Adds sample data to each table |
| `03_create-views.sql` | Generates views for simplified access |
| `04_trigger-deactivate-expired.sql` | Trigger to deactivate expired accounts |
| `05_trigger-log-inactive.sql` | Trigger to log errors for inactive accounts |
| `06_create-indexes.sql` | Adds indexes to optimize performance |
| `spRegister.sql` | Stored procedure to register new accounts |
| `spAddTime.sql` | Stored procedure to add time to a subscription |
| `spAddChar.sql` | Stored procedure to add characters to accounts |
| `spAddItem.sql` | Stored procedure to add items to inventory |
| `spSendLetter.sql` | Stored procedure to simulate in-game communication |

---

## 🖥️ How to Run

### 💾 Prerequisites
- **Operating System**: Windows 10 or 11
- **Database Engine**: [SQL Server Developer Edition 2022](https://go.microsoft.com/fwlink/p/?linkid=2215158)
- **Interface**: SQL Server Management Studio (SSMS)

### 🛠️ Setup Steps

1. **Install SQL Server Developer Edition**
2. **Install SSMS**
3. **Open SSMS** and connect to your local server
4. Execute scripts in the following order:
   - `01_create-db-and-tables.sql` *(Update file path to your own machine!)*
   - `02_insert-sample-data.sql`
   - All other scripts as required

> ⚠️ **Note**: Only the first script requires changing the file path (`FILENAME`). No changes needed for others.


