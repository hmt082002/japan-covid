-- vaccination_progress.sql
-- Track vaccination rollout over time (national level)

SELECT
    date,
    SUM(vaccinated_1st) AS total_first_dose,
    SUM(vaccinated_2nd) AS total_second_dose,
    SUM(vaccinated_3rd) AS total_third_dose,
    SUM(vaccinated_4th) AS total_fourth_dose,
    SUM(vaccinated_5th) AS total_fifth_dose
FROM covid_jpn_total
GROUP BY date
ORDER BY date;
