# Database Indexing, Optimization, and Access Control

This repository contains the SQL scripts and documentation for the **Database Indexing and Optimization** assignment. The goal of this project is to analyze query performance using indexing, implement role-based access control (RBAC), enforce security measures using views, and solve real-world analytical database problems using MySQL.

---

## 📋 Objectives
- **Indexing & Optimization**: Create and drop indexes on frequently queried columns to improve query execution speed.
- **User Accounts & Roles**: Manage database privileges using structured roles and restricted user access.
- **Database Security**: Enforce column-level security using SQL views to prevent exposing sensitive data.
- **Advanced SQL Queries**: Write analytical queries utilizing `JOIN`s, aggregate functions, and Window Functions (`DENSE_RANK()`).

---

## 📁 Repository Structure

| File | Description |
| :--- | :--- |
| `answers.sql` | Contains all executed SQL queries for indexing, security, privileges, and analytics. |
| `README.md` | Documentation for project overview, schema structure, and instructions. |

---

## 🗄️ Database Schema Overview

The queries are written against the `salesDB` schema:

- **`customers`**: Customer account data and sales rep assignments.
- **`orders`**: Order transaction header details (dates, status).
- **`orderdetails`**: Line items for each order (quantity ordered, unit prices).
- **`products`**: Product details, MSRP, buy prices, and product lines.
- **`employees`**: Employee reporting structure and sales rep numbers.

---

## 🚀 Execution Instructions

### Prerequisites
- MySQL Server (v8.0 or later recommended)
- Access to MySQL Command Line Interface (CLI) or a GUI tool (DBeaver, MySQL Workbench)

### Running the Queries

1. Clone or download this repository.
2. Open your terminal or MySQL command line interface.
3. Import or execute the `answers.sql` file against your local database:

```bash
mysql -u root -p salesDB < answers.sql
