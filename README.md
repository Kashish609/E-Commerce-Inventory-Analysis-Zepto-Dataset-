# E-Commerce-Inventory-Analysis-Zepto-Dataset-
SQL-based E-Commerce Inventory Analysis project simulating real-world retail data workflows including database setup, EDA, data cleaning, and business-driven insights using PostgreSQL.

This project is a SQL-based data analysis simulation built on an e-commerce inventory dataset inspired by a quick-commerce retail platform. It replicates real-world data analyst workflows, from database creation and data cleaning to business-focused insight generation using PostgreSQL.

# Project Objective

The objective of this project is to simulate how data analysts work in retail and e-commerce environments by designing a structured inventory database, performing exploratory data analysis (EDA), cleaning raw retail data, and generating business insights related to pricing, discounts, and inventory.

# Dataset Overview

The dataset represents an e-commerce inventory system where each row corresponds to a unique SKU (Stock Keeping Unit). Products may appear multiple times due to different package sizes, weights, or discount structures, reflecting real catalog complexity.

# Columns included:
sku_id – Unique identifier (Primary Key)
category – Product category
name – Product name
mrp – Maximum Retail Price (₹)
discountPercent – Discount applied
discountedSellingPrice – Final selling price
availableQuantity – Units available
weightInGms – Product weight in grams
outOfStock – Stock availability flag
quantity – Units per package
Project Workflow

Database Setup – Created a structured PostgreSQL table with appropriate data types and a primary key.
Data Import – Imported CSV data, resolved encoding issues, and verified row consistency.
Exploratory Data Analysis – Counted records, analyzed category distribution, checked stock availability, detected duplicates, and identified null values.
Data Cleaning – Removed invalid pricing entries and ensured consistency across numeric columns.
Business Insights – Answered key analytical questions including:

# Top discounted products
High-MRP out-of-stock products
Potential revenue by category
Expensive products with low discounts
Categories with highest average discount
 Price-per-gram value comparison
weight-based grouping (Low / Medium / Bulk)
Total inventory weight per category

# SQL Concepts Demonstrated
SELECT and WHERE
GROUP BY and HAVING
ORDER BY
Aggregate functions (SUM, AVG, COUNT)

# CASE statements
Data cleaning techniques

# Skills Demonstrated
SQL (PostgreSQL), Data Cleaning, Exploratory Data Analysis, Business-Oriented Querying, and Retail Inventory Analytics.
