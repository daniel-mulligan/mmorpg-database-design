# mmorpg-database-design
Fully normalized relational database schema for an MMORPG player and inventory system.

# 🎮 MMORPG Database Design

This project demonstrates the conceptual and relational design of a database system for a Massive Multiplayer Online Role Playing Game (MMORPG). It was developed as part of an academic coursework module focusing on relational database normalization and design theory.

> **Note:** This is a theoretical database design project — no SQL implementation is included.

---

## 📚 Overview

The system manages:
- Player accounts and login credentials
- Character data including teams and skills
- In-game inventory with item tracking
- Error logs tied to account activity

---

## 🔄 Normalization Process

The project walks through:
- **0NF** – Raw data listing
- **1NF** – Atomic data and removal of repeating groups
- **2NF** – Elimination of partial dependencies
- **3NF** – Elimination of transitive dependencies

The project overview is documented in [project-overview.md](docs/project-overview.md).
Each stage of normalization is documented in [normalization-process.md](docs/normalization-process.md).
