# Zepto-Inventory-Data-Analysis-Project

This project is a real-world SQL data analysis project based on an e-commerce inventory dataset scraped from Zepto, one of India’s fastest-growing quick-commerce platforms.

The goal of this project is to simulate how data analysts work in retail and e-commerce companies, starting from raw, messy data and transforming it into business-ready insights using SQL.

🎯 Project Objectives

• Design and set up a realistic e-commerce inventory database
• Perform Exploratory Data Analysis (EDA) on product, pricing, and stock data
• Apply data cleaning techniques to fix inconsistencies and invalid records
• Write business-focused SQL queries to support decision-making around pricing, inventory, and revenue

🔧 Project Workflow

• Database & Table Creation using PostgreSQL
• CSV Data Import and encoding issue resolution (UTF-8)
• Exploratory Data Analysis (EDA)
• Data Cleaning & Transformation
• Business-Driven SQL Analysis

📁 Dataset Overview

• Source: Kaggle (originally scraped from Zepto’s official product listings)

  https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset/data
  
• Domain: E-commerce / Quick-commerce / Retail Analytics
• Granularity: Each row represents a unique SKU (Stock Keeping Unit)
• Duplicate product names exist because the same product appears with different:
  * package sizes
  * weights
  * discounts
  * categories
This reflects real-world e-commerce catalog behavior.

🧹 Data Cleaning Performed

• Removed products with invalid pricing (MRP = 0)
• Handled missing and inconsistent values
• Converted prices from paise to rupees
• Ensured realistic pricing and inventory metrics

📊 Key Business Insights

• Identified top best-value products based on discount percentage
• Found high-MRP products that are out of stock
• Estimated category-wise revenue contribution
• Analyzed price per gram to identify value-for-money products
• Grouped products into Low / Medium / Bulk categories by weight
• Calculated total inventory weight per category
• Compared average MRP vs discounted price across categories

🛠️ Tools & Technologies

• PostgreSQL
• SQL (DDL, Aggregations, CASE, Subqueries)
• Exploratory Data Analysis
• Business & Product Analytics
