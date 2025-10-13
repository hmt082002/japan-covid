-- prefecture_trends.sql
-- Analyse COVID-19 trends across Japan's prefectures.

SELECT
    prefecture_name,
    SUM(positive) AS total_cases,
    SUM(fatal) AS total_deaths,
    ROUND(CAST(SUM(fatal) AS numeric) / NULLIF(CAST(SUM(positive) AS numeric), 0) * 100, 2) AS death_rate_percent,
    ROUND(AVG(hosp_severe), 2) AS avg_severe_cases
FROM covid_jpn_prefecture
GROUP BY prefecture_name
ORDER BY total_cases DESC;
