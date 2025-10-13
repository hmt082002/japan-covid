-- summary_stats.sql
-- Calculate key national-level COVID-19 summary statistics for Japan.

SELECT
    MAX(date) AS last_update,
    SUM(positive) AS total_cases,
    SUM(fatal) AS total_deaths,
    ROUND(CAST(SUM(fatal) AS numeric) / NULLIF(CAST(SUM(positive) AS numeric), 0) * 100, 2) AS death_rate_percent
FROM covid_jpn_total;


