# Walmart Sales Data Analysis using Python and MySQL

## Project Overview

This project is an end-to-end data analytics solution designed to extract critical business insights from Walmart sales data. It combines Python for data processing, MySQL for advanced querying, and structured problem-solving techniques to answer key business questions.

The project is ideal for data analysts aiming to strengthen their skills in data cleaning, SQL querying, and data pipeline creation.

## Project Steps

###1. Environment Setup
Tools Used: VS Code, Python, MySQL

Organized project folders for smooth development and data handling.

###2. Kaggle API Integration
Obtained Kaggle API token and configured it to download datasets directly.

Used kaggle datasets download -d <dataset-path> to pull the Walmart Sales dataset.

### 3. Data Acquisition
Downloaded and stored Walmart sales dataset in the data/ folder for easy reference.

### 4. Library Installation & Data Loading
Installed required Python libraries:

bash
Copy
Edit
pip install pandas numpy sqlalchemy mysql-connector-python psycopg2
Loaded data into Pandas DataFrame for initial exploration.

### 5. Data Exploration
Used .info(), .describe(), and .head() to understand dataset structure, distribution, and potential issues.

### 6. Data Cleaning
Removed duplicates and handled missing values.

Fixed inconsistent data types (e.g., dates → datetime, prices → float).

Standardized currency formatting and validated cleaned data.

### 7. Feature Engineering
Created a Total Amount column (unit_price × quantity) to simplify revenue calculations and aggregation tasks.

### 8. Database Integration (MySQL)
Established connections using SQLAlchemy.

Automated table creation and data insertion into both databases.

Verified successful loading using initial SQL queries.

### 9. SQL Analysis – Solving Business Problems
Performed complex SQL queries to answer critical business questions:

- Revenue trends across branches and categories

- Best-selling product categories

- Sales performance by time, city, and payment method

- Peak sales periods and customer buying patterns

- Profit margin analysis by branch and category

### 10. Project Publishing

Published project on GitHub with:

README.md (this file)

Jupyter Notebooks

SQL query scripts

Data files (or steps to access them)

## Project Structure
graphql
Copy
Edit
|-- data/                     # Raw and cleaned datasets
|-- sql_queries/              # SQL scripts for analysis
|-- notebooks/                # Jupyter notebooks for Python analysis
|-- README.md                 # Project documentation
|-- requirements.txt          # Required Python libraries
|-- main.py                   # Main script for ETL and processing

## Key Results & Insights
Sales Insights: Identified top-selling product categories and high-performing branches.

Profitability: Determined the most profitable locations and categories.

Customer Behavior: Analyzed peak shopping hours, preferred payment methods, and trends in ratings.

## Future Enhancements
Integration with Tableau for interactive dashboards.

Incorporation of additional datasets to enrich analysis.

Automation of the ETL pipeline for real-time analytics.

## Tech Stack
Programming: Python (Pandas, NumPy, SQLAlchemy)

Databases: MySQL

Other Tools: Kaggle API, VS Code

## Requirements
Python 3.8+

MySQL

Required libraries:

bash
Copy
Edit
pandas
numpy
sqlalchemy
mysql-connector-python


## Acknowledgments
Dataset: Kaggle Walmart Sales Dataset
