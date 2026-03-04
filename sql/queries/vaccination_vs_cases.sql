-- vaccination_vs_cases.sql
-- Compare total cases vs vaccination rates over time
-- Author: Hue-Mai Tang
-- Created: February 2026

SELECT
    date,
    SUM(positive) AS total_cases,
    SUM(vaccinated_1st) AS vaccinated_1st,
    SUM(vaccinated_2nd) AS vaccinated_2nd,
    ROUND(
        (SUM(vaccinated_2nd)::numeric / NULLIF(SUM(vaccinated_1st)::numeric, 0)) * 100,
        2
    ) AS second_dose_percent_of_first
FROM covid_jpn_total
GROUP BY date
ORDER BY date;
