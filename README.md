# PizzaHut_Sales_Analysis-SQL

# Pizza Hut Sales Analysis - SQL Documentation

## Overview
This documentation provides an overview of the SQL-based analysis performed on Pizza Hut sales data. The goal of the analysis was to extract meaningful insights regarding sales performance, popular items, and revenue generation.

## Contents
- [Introduction](#introduction)
- [Database Structure](#database-structure)
- [SQL Techniques Used](#sql-techniques-used)
- [Analysis Summary](#analysis-summary)
- [Conclusion](#conclusion)

## Introduction
This analysis was conducted using SQL to query and analyze the sales data from Pizza Hut. The analysis covers various metrics, including the total number of orders, revenue generation, most popular pizzas, and more. The following sections detail the database structure and the SQL techniques employed.

## Database Structure
The analysis utilized a relational database structured with the following key tables:
- **Orders:** Contains information about each order placed, including order ID, date, and time.
- **Order Details:** Contains details for each item in an order, such as quantity and pizza type.
- **Pizzas:** Lists the available pizzas, including their IDs, types, sizes, and prices.
- **Pizza Types:** Defines the categories and names of the different types of pizzas.

## SQL Techniques Used
A variety of SQL techniques were employed to perform the analysis, including:

### Data Retrieval and Aggregation
- **`SELECT` Statements:** Extract specific data from the tables.
- **Aggregate Functions:** 
  - **`COUNT`:** Used to count records, such as the total number of orders.
  - **`SUM`:** Calculated the total revenue from sales.
  - **`ROUND`:** Rounded the revenue figures to two decimal places.

### Data Grouping and Filtering
- **`GROUP BY` Clause:** Grouped data by specific attributes, such as pizza size or type, to analyze patterns.
- **`ORDER BY` Clause:** Sorted data to identify top-performing categories.
- **`LIMIT` Clause:** Limited the number of results to focus on the most significant data points.

### Joins and Relationships
- **`JOIN` Operations:** Combined data from multiple tables to provide a comprehensive view of the dataset. Key relationships were established between orders, pizzas, and pizza types.

### Subqueries and Common Table Expressions (CTEs)
- **Subqueries:** Used for advanced filtering and aggregation within larger queries.
- **CTEs:** Simplified complex queries by breaking them into more manageable components.

## Analysis Summary
The analysis provided several key insights:
- **Total Orders:** Calculated to understand the volume of business.
- **Revenue:** Aggregated to assess financial performance.
- **Most Popular Pizzas:** Identified by grouping and counting orders.
- **Sales Trends:** Analyzed by time of day and pizza categories.

## Conclusion
The SQL analysis effectively extracted meaningful insights from the Pizza Hut sales data, leveraging a range of SQL techniques to provide a comprehensive view of the business performance. This documentation provides a high-level overview of the methods used, which can serve as a reference for future analyses or enhancements.

