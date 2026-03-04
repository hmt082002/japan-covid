-- daily_new_cases.sql
-- Calculates daily new COVID-19 cases per prefecture and cumulative cases over time.
-- Uses the LAG() function to calculate daily new cases by comparing the current day's positive cases with the previous day's cases.
-- Author: Hue-Mai Tang
-- Created: February 2026

SELECT
    date,
    prefecture_name,
    positive AS cumulative_cases,
    positive - LAG(positive) OVER (
        PARTITION BY prefecture_name
        ORDER BY date
    ) AS daily_new_cases
FROM covid_jpn_prefecture
ORDER BY prefecture_name, date;