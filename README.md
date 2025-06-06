# 🚚 Cargo Management System - SQL Database

This project implements a structured Cargo Management System using MySQL. It defines a relational database schema suitable for managing customers, cargo, shipments, warehouses, payments, insurance, and real-time tracking for a logistics company.

---

## 📁 Features

- Customer & Employee data handling  
- Carrier & Shipper information  
- Cargo details including weight, cost, and tracking  
- Warehouse and route management  
- Payment and insurance integration  
- Real-time cargo tracking system  

---

## 🛠️ Installation

1. Clone the repository or download the SQL files.
2. Open your MySQL Workbench or preferred SQL interface.
3. Execute the following:

```sql
CREATE DATABASE cargo_management_system;
USE cargo_management_system;
SOURCE schema.sql;
SOURCE insert.sql;
