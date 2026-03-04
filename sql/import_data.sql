-- import_data.sql
-- Import raw and cleaned CSV data into tables.
-- Author: Hue-Mai Tang
-- Created: October 2025

\copy covid_jpn_meta(prefecture, category, item, value, date, primary_source, secondary_source)
FROM 'data/clean/covid_jpn_metadata.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy covid_jpn_prefecture(date, prefecture_name, positive, tested, discharged, fatal, hosp_require, hosp_severe)
FROM 'data/clean/covid_jpn_prefecture.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy covid_jpn_total(date, location, positive, tested, symptomatic, asymptomatic, sym_unknown, hosp_require, hosp_mild, hosp_severe, hosp_unknown, hosp_waiting, discharged, fatal, vaccinated_1st, vaccinated_2nd, vaccinated_3rd, vaccinated_4th, vaccinated_5th)
FROM 'data/raw/covid_jpn_total.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
