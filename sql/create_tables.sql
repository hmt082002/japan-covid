-- create_tables.sql
-- Schema for Japan COVID-19 Analysis Project
-- Author: Hue-Mai Tang
-- Created: October 2025


-- Prefecture-level case and hospitalization data.
CREATE TABLE IF NOT EXISTS covid_jpn_prefecture (
    date DATE,
    prefecture_name TEXT,
    positive INTEGER,
    tested INTEGER,
    discharged INTEGER,
    fatal INTEGER,
    hosp_require INTEGER,
    hosp_severe INTEGER
);


-- National level cumulative COVID-19 data including tests, hospitalizations, and vaccination counts
CREATE TABLE IF NOT EXISTS covid_jpn_total (
    date DATE,
    location TEXT,
    positive INTEGER,
    tested INTEGER,
    symptomatic INTEGER,
    asymptomatic INTEGER,
    sym_unknown INTEGER,
    hosp_require INTEGER,
    hosp_mild INTEGER,
    hosp_severe INTEGER,
    hosp_unknown INTEGER,
    hosp_waiting INTEGER,
    discharged INTEGER,
    fatal INTEGER,
    vaccinated_1st BIGINT,
    vaccinated_2nd BIGINT,
    vaccinated_3rd BIGINT,
    vaccinated_4th BIGINT,
    vaccinated_5th BIGINT
);

-- Metadata describing each prefecture
CREATE TABLE IF NOT EXISTS covid_jpn_meta (
    prefecture TEXT,
    category TEXT,
    item TEXT,
    value TEXT,
    date DATE,
    primary_source TEXT,
    secondary_source TEXT
);