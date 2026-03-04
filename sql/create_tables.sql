-- create_tables.sql
-- Schema for Japan COVID-19 Analysis Project
-- Author: Hue-Mai Tang
-- Created: October 2025

DROP TABLE covid_jpn_prefecture;
DROP TABLE covid_jpn_total;
DROP TABLE covid_jpn_meta;

-- Prefecture-level case and hospitalization data.
CREATE TABLE IF NOT EXISTS covid_jpn_prefecture (
	date DATE NOT NULL,
	prefecture_name TEXT NOT NULL,
	positive INTEGER,
	tested INTEGER,
	discharged INTEGER,
	fatal INTEGER,
	hosp_require INTEGER,
	hosp_severe INTEGER,
	PRIMARY KEY (date, prefecture_name)
);


-- National level cumulative COVID-19 data including tests, hospitalizations, and vaccination counts
CREATE TABLE IF NOT EXISTS covid_jpn_total (
	date DATE NOT NULL,
	location TEXT NOT NULL,
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
	vaccinated_5th BIGINT,
	PRIMARY KEY (date, location)
);

-- Metadata describing each prefecture
CREATE TABLE IF NOT EXISTS covid_jpn_meta (
	prefecture TEXT NOT NULL,
	category TEXT,
	item TEXT,
	value TEXT,
	date DATE,
	primary_source TEXT,
	secondary_source TEXT
);