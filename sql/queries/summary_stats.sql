-- summary_stats.sql
-- Shows total cases, total fatalities, peak daily cases, peak date per prefecture, plus a final row with national totals
-- Author: Hue-Mai Tang
-- Created: January 2026

WITH daily_cases AS (
    SELECT
        date,
        prefecture_name,
        positive - LAG(positive) OVER (
            PARTITION BY prefecture_name
            ORDER BY date
        ) AS daily_new_cases,
        fatal
    FROM covid_jpn_prefecture
),
peak_cases AS (
    SELECT
        prefecture_name,
        MAX(daily_new_cases) AS peak_daily_cases
    FROM daily_cases
    GROUP BY prefecture_name
),
peak_dates AS (
    SELECT
        d.prefecture_name,
        MIN(d.date) AS peak_date
    FROM daily_cases d
    JOIN peak_cases p
      ON d.prefecture_name = p.prefecture_name
     AND d.daily_new_cases = p.peak_daily_cases
    GROUP BY d.prefecture_name
),
prefecture_summary AS (
    SELECT
        d.prefecture_name,
        SUM(d.daily_new_cases) AS total_cases,
        SUM(d.fatal) AS total_fatalities,
        p.peak_daily_cases,
        pd.peak_date
    FROM daily_cases d
    JOIN peak_cases p
        ON d.prefecture_name = p.prefecture_name
    JOIN peak_dates pd
        ON d.prefecture_name = pd.prefecture_name
    GROUP BY d.prefecture_name, p.peak_daily_cases, pd.peak_date
),
prefecture_with_sort AS (
    SELECT *, 0 AS sort_order FROM prefecture_summary
    UNION ALL
    SELECT
        'Japan (National)' AS prefecture_name,
        SUM(total_cases) AS total_cases,
        SUM(total_fatalities) AS total_fatalities,
        MAX(peak_daily_cases) AS peak_daily_cases,
        MIN(peak_date) AS peak_date,
        1 AS sort_order
    FROM prefecture_summary
)

SELECT prefecture_name, total_cases, total_fatalities, peak_daily_cases, peak_date
FROM prefecture_with_sort
ORDER BY sort_order DESC, total_cases DESC;