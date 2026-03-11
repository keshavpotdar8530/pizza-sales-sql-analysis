# 🍕 Pizza Sales Data Analysis using SQL

## 📌 Project Overview

This project analyzes pizza sales data using **SQL** to uncover insights related to customer ordering behavior, sales performance, and product popularity.

The objective of this analysis is to answer key business questions such as:   

* How many orders were placed?  
* Which pizzas generate the most revenue?  
* What pizza sizes are most popular?  
* Which pizza categories perform best?  
* What are the peak order hours?  

The project demonstrates **data analysis skills using SQL**, including joins, aggregations, window functions, ranking functions, and subqueries.

---

## 📊 Dataset Description

The dataset consists of **four relational tables** representing pizza sales transactions.

### 1️⃣ orders

Stores information about each order.

| Column     | Description                      |
| ---------- | -------------------------------- |
| order_id   | Unique identifier for each order |
| order_date | Date the order was placed        |
| order_time | Time the order was placed        |

---

### 2️⃣ order_details

Contains details of each pizza included in an order.

| Column           | Description                           |
| ---------------- | ------------------------------------- |
| order_details_id | Unique identifier for each order item |
| order_id         | References the order                  |
| pizza_id         | References the pizza ordered          |
| quantity         | Number of pizzas ordered              |

---

### 3️⃣ pizzas

Stores pizza size and pricing information.

| Column        | Description                   |
| ------------- | ----------------------------- |
| pizza_id      | Unique pizza identifier       |
| pizza_type_id | References pizza type         |
| size          | Pizza size (S, M, L, XL, XXL) |
| price         | Price of the pizza            |

---

### 4️⃣ pizza_types

Contains information about the type of pizza.

| Column        | Description                      |
| ------------- | -------------------------------- |
| pizza_type_id | Unique identifier for pizza type |
| name          | Name of the pizza                |
| category      | Pizza category                   |
| ingredients   | List of ingredients              |

---

## 🗂 Database Schema

The tables are connected using **primary keys and foreign keys**.
orders
⬇
order_details
⬇
pizzas
⬇
pizza_types

### Primary Keys

| Table         | Primary Key      |
| ------------- | ---------------- |
| orders        | order_id         |
| order_details | order_details_id |
| pizzas        | pizza_id         |
| pizza_types   | pizza_type_id    |

### Foreign Keys

| Table         | Foreign Key   | Reference   |
| ------------- | ------------- | ----------- |
| order_details | order_id      | orders      |
| order_details | pizza_id      | pizzas      |
| pizzas        | pizza_type_id | pizza_types |

---

## 🛠 Tools Used

* SQL (MySQL)  
* GitHub  
* PowerPoint (for query result screenshots)  

---

## 📁 Project Structure

```text
pizza-sales-sql-analysis
│
├── data
│   ├── orders.csv
│   ├── order_details.csv
│   ├── pizzas.csv
│   └── pizza_types.csv
│
├── sql_queries
│   └── pizza_sales_analysis.sql
│
├── query_results
│   └── pizza_sales_query_results.pptx
│
└── README.md

🔎 Analysis Questions

The following business questions were analyzed using SQL:

1.Retrieve the total number of orders placed

2.Calculate the total revenue generated from pizza sales

3.Identify the highest priced pizza

4.Identify the most common pizza size ordered

5.List the top 5 most ordered pizza types along with their quantities

6.Find the total quantity of each pizza category ordered

7.Determine the distribution of orders by hour of the day

8.Determine the top 3 most ordered pizza types based on revenue

9.Calculate the percentage contribution of each pizza category to total revenue

10.Analyze the cumulative revenue generated over time

11.Determine the top 3 most ordered pizza types based on revenue for each category

sql_queries/pizza_sales_analysis.sql

📈 Key Insights

Certain pizza sizes are significantly more popular than others.

A small number of pizza types contribute to a large percentage of total revenue.

Sales activity peaks during specific hours of the day.

Some pizza categories consistently outperform others in terms of total quantity sold.

Revenue trends show consistent growth over time.

These insights help understand customer preferences and sales performance.


📷 Query Results

Screenshots of SQL queries and their results are available in:
query_results/pizza_sales_query_results.pdf

This presentation contains:

SQL query

Query output

Result screenshots

These screenshots demonstrate how insights were derived from the dataset.

🚀 How to Run This Project

Import the CSV files into your SQL database.

Create tables matching the dataset structure.

Insert the data from the CSV files.

Run the SQL queries provided in:

sql_queries/pizza_sales_analysis.sql

🎯 Skills Demonstrated

SQL Joins

Data Aggregation

Group By operations

Window Functions

Ranking Functions

Subqueries

Revenue Analysis

Business Insight Generation

📌 Project Purpose

The goal of this project is to practice SQL for data analysis and build a portfolio-ready project that demonstrates the ability to extract insights from relational datasets.

👤 Author

Keshav Potdar

Aspiring Data Analyst with a strong interest in SQL, Data Analytics, and Business Insights.