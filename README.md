# ElevateLabs_Internship_Task-6
Sales Trend Analysis Using Aggregation
# Task 6 – Sales Trend Analysis (PostgreSQL)

## 📌 Overview
This project analyzes monthly and yearly sales trends from an online sales dataset using PostgreSQL.  
It includes key performance metrics such as total revenue, order volume, top months, and best-selling products.

---

## 📂 Dataset Preparation
For this task, a custom dataset was created to match the required columns:
- `order_id` – Unique identifier for each order
- `order_date` – Date of the order
- `amount` – Sales amount per order line
- `product_id` – Unique product identifier

The dataset was generated using sample sales transactions to ensure it contained sufficient variation across different months and products for meaningful analysis.

---

## 📊 Analysis Performed

### **1. Monthly Revenue & Order Volume**
Aggregates sales data by year and month to observe overall sales and ordering patterns.

### **2. Top 3 Months by Revenue**
Identifies the months with the highest total sales to highlight peak performance periods.

### **3. Yearly Total Revenue & Order Volume**
Summarizes annual sales and order counts to measure growth year-over-year.

### **4. Average Order Value (AOV) per Month**
Calculates the average revenue per order for each month to measure efficiency and customer spending trends.

### **5. Top 5 Products by Total Sales**
Identifies the best-selling products to support inventory and marketing decisions.

---

## 📂 Files in This Repository

| File Name                  | Description |
|----------------------------|-------------|
| `analysis.sql`             | Contains all 5 SQL queries with comments. |
| `monthly_sales_summary.csv`| Output of Query 1. |
| `top3_months.csv`          | Output of Query 2. |
| `yearly_summary.csv`       | Output of Query 3. |
| `avg_order_value.csv`      | Output of Query 4. |
| `top_products.csv`         | Output of Query 5. |
| `README.md`                | Project description and explanations. |

---

## 📌 Notes
- Dataset was manually created for demonstration purposes.
- `COALESCE()` was used to handle NULL values in sales data.
- `COUNT(DISTINCT order_id)` ensures unique orders are counted.
- Queries are written in **PostgreSQL** syntax.
