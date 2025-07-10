Zepto Inventory Analysis using SQL

A data-driven inventory analysis project inspired by Zepto — a fast-growing quick-commerce startup. This project demonstrates real-world SQL skills applied to retail inventory datasets to derive actionable business insights.

---

## 📌 Project Overview

The goal is to simulate how actual data analysts in the e-commerce or retail industries work behind the scenes to use SQL to:

✅ Set up a messy, real-world e-commerce inventory database
✅ Perform Exploratory Data Analysis (EDA) to explore product categories, availability, and pricing inconsistencies
✅ Implement Data Cleaning to handle null values, remove invalid entries, and convert pricing from paise to rupees
✅ Write business-driven SQL queries to derive insights around pricing, inventory, stock availability, revenue and more

---

## 📁 Dataset Overview

The dataset was sourced from Kaggle and was originally scraped from Zepto’s official product listings. It mimics what you’d typically encounter in a real-world e-commerce inventory system.

Each row represents a unique SKU (Stock Keeping Unit) for a product. Duplicate product names exist because the same product may appear multiple times in different package sizes, weights, discounts, or categories to improve visibility – exactly how real catalog data looks.

### 🧾 Columns:

* sku_id: Unique identifier for each product entry (Synthetic Primary Key)
* name: Product name as it appears on the app
* category: Product category like Fruits, Snacks, Beverages, etc.
* mrp: Maximum Retail Price (originally in paise, converted to ₹)
* discountPercent: Discount applied on MRP
* discountedSellingPrice: Final price after discount (also converted to ₹)
* availableQuantity: Units available in inventory
* weightInGms: Product weight in grams
* outOfStock: Boolean flag indicating stock availability
* quantity: Number of units per package (mixed with grams for loose produce)

---

## 🔧 Project Workflow

1. Database & Table Creation

We start by creating a SQL table with appropriate data types:
'''sql
CREATE TABLE zepto (
  sku_id SERIAL PRIMARY KEY,
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL,
  mrp NUMERIC(8,2),
  discountPercent NUMERIC(5,2),
  availableQuantity INTEGER,
  discountedSellingPrice NUMERIC(8,2),
  weightInGms INTEGER,
  outOfStock BOOLEAN,
  quantity INTEGER
);
'''


2. Data Import

Loaded CSV using pgAdmin's import feature.

If you're not able to use the import feature, write this code instead:

\copy zepto(category,name,mrp,discountPercent,availableQuantity,
            discountedSellingPrice,weightInGms,outOfStock,quantity)
  FROM 'data/zepto_v2.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ENCODING 'UTF8');

Faced encoding issues (UTF-8 error), which were fixed by saving the CSV file using CSV UTF-8 format.

3. 🔍 Data Exploration

Counted the total number of records in the dataset

Viewed a sample of the dataset to understand structure and content

Checked for null values across all columns

Identified distinct product categories available in the dataset

Compared in-stock vs out-of-stock product counts

Detected products present multiple times, representing different SKUs

4. 🧹 Data Cleaning

Identified and removed rows where MRP or discounted selling price was zero

Converted mrp and discountedSellingPrice from paise to rupees for consistency and readability
### 5. 📊 Business Insights

* Found top 10 best-value products based on discount percentage
* Identified high-MRP products that are currently out of stock
* Estimated potential revenue for each product category
* Filtered expensive products (MRP > ₹500) with minimal discount
* Ranked top 5 categories offering highest average discounts
* Calculated price per gram to identify value-for-money products
* Grouped products based on weight into Low, Medium, and Bulk categories
* Measured total inventory weight per product category

---

## ▶ How to Use This Project

### Prerequisites:

* PostgreSQL installed (or any SQL-compatible DBMS)
* pgAdmin or preferred SQL client

### Steps:

1. Clone this repository:

'''bash
git clone https://github.com/aravind-raj0207/Zepto_dataAnalysis
cd zepto-inventory-analysis
'''

2. Import the SQL table schema using the SQL code provided above.
3. Load the dataset (CSV) into the table using the \copy command.
4. Run the SQL queries shared in the project to explore, clean, and analyze the data.
5. (Optional) Build dashboards using Power BI or Tableau from exported CSV queries.

---

## 📊 Power BI Dashboard Overview

Built an interactive Power BI dashboard that visualizes:

* KPIs: Total Quantity, Available Quantity, Average Discount
* Bar Chart: Quantity by Category
* Pie Chart: Top 5 Products by Quantity
* Donut Chart: Category-wise Discount Percent
* Line Chart: Total Revenue vs Discount by Category
* Area Chart: Product Weight by Name
* Slicers: Category, Out-of-Stock filters

![WhatsApp Image 2025-07-10 at 18 55 36_87e09d18](https://github.com/user-attachments/assets/12cc48cb-2174-4d1a-9c10-f49cbf455c71)


---

## 🔧 Tools & Technologies

* *SQL (PostgreSQL)*
* *pgAdmin* for local SQL execution
* *Power BI* for data visualization
* *GitHub* for version control and documentation

---

## 🤝 Connect with Me

*Aravind raj J*
🎓 BCA
📧 [aravindraj.j02@gmail.com](mailto:jraj272005@gmail.com)
🔗 [LinkedIn](https://linkedin.com/in/aravindraj272005)

---

> ⭐ Don’t forget to Star this repository if you found it helpful!

The dataset is used in this project was 'https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset?resource=download'



