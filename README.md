# Japan COVID-19 Data Analysis

## Overview
This project provides an overview of COVID-19 in Japan from 2020 to 2023, focusing on both national and prefecture-level data. The dataset was sourced from Kaggle and processed using SQL queries in PostgreSQL. The project includes an interactive dashboard to analyze cases, fatalities, vaccinations, and daily new cases.

## Data Sources
- **Kaggle COVID-19 Japan Dataset**: [Kaggle Dataset](https://www.kaggle.com/datasets/lisphilar/covid19-dataset-in-japan), which used data from the Ministry of Health, Labour and Welfare in Japan

## Data Cleaning Scripts
The repository contains two Python scripts that were used to clean the raw CSV data files before analysis. These scripts remove any empty or irrelevant columns from the raw datasets and save the cleaned versions in the `clean` folder.

1. **clean_covid_prefecture.py**:
   - This script takes the raw COVID-19 data for each prefecture, removes any empty columns, and saves a cleaned version of the data.
   - It ensures that the data for each prefecture is properly formatted and ready for analysis.

2. **clean_covid_total.py**:
   - This script performs the same cleaning process on the national-level COVID-19 data. It removes empty columns and outputs the cleaned version of the dataset.
   - The cleaned dataset is used to perform national-level analysis and comparisons.

## Database Schema
### Tables
1. **covid_jpn_total**: National-level data, including cumulative cases, deaths, hospitalizations, and vaccinations.
2. **covid_jpn_prefecture**: Prefecture-level data for cases, fatalities, and vaccinations.
3. **covid_jpn_meta**: Metadata for prefectures, including geographical and demographic information.

## SQL Files

1. **create_tables.sql**: Creates the tables in PostgreSQL for storing the data.
2. **import_data.sql**: Loads CSV files containing COVID-19 data into the PostgreSQL database.

SQL queries used to process and analyze the data can be found in the queries folder. The following SQL scripts are included:

1. **summary_stats.sql**: Provides summary statistics such as total cases, deaths, and vaccinations for each prefecture.
2. **rolling_average_cases.sql**: Calculates the rolling average of COVID-19 cases over a defined period (in this case 7 days) for smoother trend analysis.
3. **daily_new_cases.sql**: Shows daily new COVID-19 cases by prefecture, helping to track the daily spread of the virus.
4. **vaccination_vs_cases.sql**: Analyzes the relationship between vaccination rates and the number of COVID-19 cases across prefectures.

## How to Run

1. **Set up PostgreSQL**:
   - Install PostgreSQL on your machine if it is not already installed.
   - Create a new PostgreSQL database for the project.

2. **Create Tables**:
   - Run `create_tables.sql` to create the necessary database tables.
   
3. **Import Data**:
   - Run `import_data.sql` to load the provided CSV data files into the PostgreSQL tables.
   
4. **Run Queries**:
   - Use the queries in the `queries` folder to perform various data analyses and generate insights:
     - `summary_stats.sql` – Summary statistics for cases, deaths, and vaccinations.
     - `rolling_average_cases.sql` – Calculate rolling averages of daily new cases.
     - `daily_new_cases.sql` – Generate daily case counts.
     - `vaccination_vs_cases.sql` – Explore the correlation between vaccination rates and COVID-19 cases.

5. **Visualizations**:
    - Use **Power BI** to open the dashboard provided in the main folder (`japan_covid_dashboard.pbix`).

## Insights
The project reveals several key insights into COVID-19 trends in Japan, including:

### General Trends in COVID-19 Fatalities Across Japan:
Japan's cumulative COVID-19 fatalities follow a clear upward trend over the course of the pandemic, with notable spikes during major waves (e.g., the fourth and fifth waves). As expected, the highest number of fatalities are observed in the most populous prefectures, especially Tokyo and Osaka. However, fatalities are not just a reflection of population size but also of age demographics, and public health measures.

While Tokyo and Osaka report the highest number of cases, some prefectures with lower populations, such as Okinawa or Hokkaido, show higher fatality rates relative to their case numbers. This suggests that other factors may have influenced the impact of COVID-19 in these regions.

### Vaccination Campaigns and Their Effectiveness:
The national vaccination rollout played a significant role in reducing the number of severe cases and hospitalizations. Data indicates that regions with higher vaccination rates generally experienced fewer daily new cases and lower fatality rates. However, the correlation is not perfect. Even well vaccinated areas like Tokyo still saw significant outbreaks.

### Fluctuations in Daily New Cases and Peak Periods:
The daily new COVID-19 cases across Japan fluctuated significantly, with noticeable peaks during key moments of the pandemic, such as national holidays (e.g., Golden Week and New Year). These peaks were often followed by declines, reflecting the effectiveness of government measures like state of emergency declarations, vaccination campaigns and travel restrictions.

The data suggests a clear relationship between the timing of public holidays and spikes in cases. For instance, long weekends and festivals led to increased gatherings, driving up case numbers, particularly in urban areas.

## Visualizations
The dashboard includes the following visualizations:
1. **Geographic Distribution of COVID-19 Cases Across Japan by Prefecture**:
   - Interactive map showing the distribution of COVID-19 cases across Japan’s prefectures.

2. **Cumulative COVID-19 Fatalities by Prefecture**:
   - Area chart depicting cumulative fatalities across Japan, segmented by prefecture, from 2020 to 2023.

3. **Annual COVID-19 Vaccinations in Japan by Dose Type (Cumulative)**:
   - Bar chart showing the annual cumulative COVID-19 vaccinations administered in Japan, with breakdowns by dose type.

4. **Daily New COVID-19 Cases by Prefecture**:
   - Line chart illustrating the daily new COVID-19 cases for each prefecture over time.


## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
