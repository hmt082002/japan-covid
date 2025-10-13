-- infection_rate_by_prefecture.sql
-- Calculate infection rate as a percentage of population for each prefecture.

WITH pop AS (
    SELECT
        prefecture,
        CAST(value AS numeric) * 1000 AS population -- adjust for thousands
    FROM covid_jpn_meta
    WHERE category = 'Population' AND item = 'Total'
),
vax AS (
    SELECT
        prefecture_name AS prefecture,
        MAX(positive) AS total_cases,
        MAX(fatal) AS deaths
    FROM covid_jpn_prefecture
    GROUP BY prefecture_name
)
SELECT
    vax.prefecture,
    vax.total_cases,
    vax.deaths,
    pop.population,
    ROUND((vax.total_cases::numeric / NULLIF(pop.population, 0)) * 100, 2) AS infection_rate_percent
FROM vax
JOIN pop ON vax.prefecture = pop.prefecture
ORDER BY infection_rate_percent DESC;
