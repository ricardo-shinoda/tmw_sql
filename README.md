# 🎞️ Sakila DVD Rental: Relational Database Project

A comprehensive SQL project utilizing the **Sakila Sample Database** to analyze a movie rental business. This project demonstrates advanced PostgreSQL techniques, including complex multi-way joins, data aggregation, and database administrative management.

---

## 🏗️ Project Architecture
The Sakila database is a "Golden Standard" in SQL education, representing a normalized DVD rental store. It contains 15 tables with relationships covering:
* **Business Operations:** Rentals, Payments, and Inventory.
* **Content Catalog:** Films, Categories, Languages, and Actors.
* **Customer Data:** Emails, Addresses, and Store assignments.



## 🚀 Getting Started

### 1. Prerequisites
* **Environment:** macOS (M1/M2/Intel)
* **Engine:** PostgreSQL 14+ (installed via Homebrew)
* **Interface:** VSCode + SQLTools Extension

### 2. Database Setup
First, create a fresh database to host the schema:
```sql
CREATE DATABASE sakila;