# Student Performance Analysis

## Project Overview

This project explores student test scores and checks how performance varies across different factors, such as gender, ethnicity, parents' education, lunch type, and test preparation course.

The project uses Python for data cleaning and basic EDA, SQL to answer analysis questions, and Power BI to present the findings in a dashboard.

## Problem Statement

The goal is to understand how students perform in Math, Reading, and Writing, and to explore how their scores relate to different background and study-related factors.

## Tools Used

- **Python:** Data cleaning and exploratory data analysis (EDA)
- **Pandas:** Data handling and analysis
- **Matplotlib / Seaborn:** Charts for EDA
- **MySQL:** Querying the cleaned data and answering analysis questions
- **Power BI:** Dashboard and visual reporting

## Project Workflow

### 1. Data Cleaning with Python

- Loaded the student performance dataset into Python.
- Reviewed the columns and checked the data before analysis.
- Prepared the data for analysis and added a percentage column based on the subject scores.
- Created grade and performance categories to make the results easier to compare.

### 2. Exploratory Data Analysis (EDA)

- Studied the distribution of Math, Reading, and Writing scores.
- Explored student performance by gender, ethnicity, parents' education, lunch type, and test preparation course.
- Used charts to compare score patterns and performance categories.
- Looked for differences between groups and for students with unusually low scores.

### 3. SQL Analysis with MySQL

After preparing the data, loaded it into MySQL and wrote queries to answer questions such as:

- What is the average score in Math, Reading, and Writing?
- How many students fall into each Math performance category?
- How do performance categories differ by gender and lunch type?
- How do average subject scores vary across ethnicity and parents' education groups?
- How do students who completed the test preparation course compare with those who did not?
- How many students perform better in one subject than another?
- How many students fall into the Fail or Poor categories across the three subjects?

### 4. Power BI Dashboard

- Built a dashboard to present the main findings in a clear visual format.
- Used charts to compare student performance across the available categories.
- Made it easier to review patterns in scores and performance groups without reading individual SQL queries.

## Key Findings

- Most students fall into the Average performance category.
- Female students show a higher share of Good and Excellent performance in the EDA, while male students show a higher share of Poor performance.
- Students in the standard lunch group generally show stronger results than students in the free/reduced lunch group.
- Ethnicity groups show differences in average scores and performance categories; Group E has the strongest overall results in the analysis, while Group A has a lower median percentage.
- Students who completed the test preparation course have a higher share of Good and Excellent results and a higher median percentage than students who did not complete it.
- Students whose parents have a master's degree show a higher Excellent rate in the group comparison.

These findings describe patterns in this dataset. They do not prove that any single factor directly causes higher or lower scores.


## Repository Structure

```text
Student-Performance-Analysis/
├── data/                 # Dataset (StudentsPerformance is raw data and final_student data after cleaning and feature eng)  
├── Python/            # Python cleaning and EDA notebook(s)
├── SQL/                  # SQL analysis queries
├── Power Bi/              # Power BI dashboard file
└── README.md
```

*Update the folder names above to match the files in your repository.*

## How to Use

1. Download or clone this repository.
2. Open the Python notebook and run the data cleaning and EDA steps.
3. Load the prepared dataset into MySQL.
4. Run the SQL queries to explore the analysis questions.
5. Open the Power BI file to view the dashboard.

## Note

The dataset contains student scores and background categories. The findings are descriptive and should be used to understand patterns in the available data, not to make assumptions about individual students.

