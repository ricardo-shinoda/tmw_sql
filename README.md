# SQL Study Project - Teo Me Why (PostgreSQL Edition)

This repository contains my SQL learning journey based on the Teo Calvo course. While the original course uses SQLite, I have adapted all exercises to **PostgreSQL** to match the technology stack that I have been used.

## 📁 Project Structure

- `/data`: Raw CSV data files (ignored by Git due to file size).
- `/scripts`: SQL scripts for table creation, data ingestion, and analytical queries.

## 🛠️ Tech Stack

- **Database:** PostgreSQL
- **Tooling:** VS Code + SQLTools Extension
- **Data Ingestion:** `psql` CLI utility (macOS)

## 🚀 Setup & Ingestion

#### 1. Create the Database
In your SQL client or terminal:
```sql
CREATE DATABASE tmw_sql_study;

#### 2. Create Tables
Execute the creation scripts located in /scripts to set up the schema.

3. Bulk Ingest Data
To populate the database with the provided datasets, run the following commands in your terminal from the project root:

Bash
# Ingesting Customers
psql -d tmw_sql_study -c "\copy clientes FROM 'data/clientes.csv' WITH (FORMAT csv, HEADER true, DELIMITER ';');"

# Ingesting Products
psql -d tmw_sql_study -c "\copy produtos FROM 'data/produtos.csv' WITH (FORMAT csv, HEADER true, DELIMITER ';');"

# Ingesting Transactions
psql -d tmw_sql_study -c "\copy transacoes FROM 'data/transacoes.csv' WITH (FORMAT csv, HEADER true, DELIMITER ';');"
📊 Available Tables
clientes: Customer profiles and loyalty points.

produtos: Full product catalog.

transacoes: Sales records and source systems.

transacao_produto: Junction table linking products to specific transactions.