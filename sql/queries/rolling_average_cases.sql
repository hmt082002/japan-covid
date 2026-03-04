-- rolling_average_cases.sql
-- Calculates the daily new cases and the weekly rolling average of daily new cases for each prefecture.
-- The rolling average helps smooth out fluctuations and highlight longer term trends in the case data.
-- Author: Hue-Mai Tang
-- Created: January 2026

WITH daily_cases AS (
    SELECT
        date,
        prefecture_name,
        positive - LAG(positive) OVER (
            PARTITION BY prefecture_name
            ORDER BY date
        ) AS daily_new_cases
    FROM covid_jpn_prefecture
)

SELECT
    date,
    prefecture_name,
    daily_new_cases,
    ROUND(AVG(daily_new_cases) OVER (
        PARTITION BY prefecture_name
        ORDER BY date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ), 2) AS rolling_7_day_avg
FROM daily_cases
ORDER BY prefecture_name, date;