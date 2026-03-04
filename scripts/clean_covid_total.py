import pandas as pd

RAW_PATH = "data/raw/covid_jpn_total.csv"
CLEAN_PATH = "data/clean/covid_jpn_total.csv"

df = pd.read_csv(RAW_PATH, engine="python")

df = df.dropna(axis=1, how="all")

required_columns = [
    "Date",
    "Location",
    "Positive",
    "Tested",
    "Symptomatic",
    "Asymptomatic",
    "Sym-unknown",
    "Hosp_require",
    "Hosp_mild",
    "Hosp_severe",
    "Hosp_unknown",
    "Hosp_waiting",
    "Discharged",
    "Fatal",
    "Vaccinated_1st",
    "Vaccinated_2nd",
    "Vaccinated_3rd",
    "Vaccinated_4th",
    "Vaccinated_5th"
]
df = df[required_columns]

df = df.rename(columns={
    "Date": "date",
    "Location": "location",
    "Positive": "positive",
    "Tested": "tested",
    "Symptomatic": "symptomatic",
    "Asymptomatic": "asymptomatic",
    "Sym-unknown": "sym_unknown",
    "Hosp_require": "hosp_require",
    "Hosp_mild": "hosp_mild",
    "Hosp_severe": "hosp_severe",
    "Hosp_unknown": "hosp_unknown",
    "Hosp_waiting": "hosp_waiting",
    "Discharged": "discharged",
    "Fatal": "fatal",
    "Vaccinated_1st": "vaccinated_1st",
    "Vaccinated_2nd": "vaccinated_2nd",
    "Vaccinated_3rd": "vaccinated_3rd",
    "Vaccinated_4th": "vaccinated_4th",
    "Vaccinated_5th": "vaccinated_5th"
})

df['date'] = pd.to_datetime(df['date'])

numeric_cols = [
    "positive", "tested", "symptomatic", "asymptomatic", "sym_unknown",
    "hosp_require", "hosp_mild", "hosp_severe", "hosp_unknown", "hosp_waiting",
    "discharged", "fatal", "vaccinated_1st", "vaccinated_2nd",
    "vaccinated_3rd", "vaccinated_4th", "vaccinated_5th"
]
for col in numeric_cols:
    df[col] = pd.to_numeric(df[col], errors="coerce").fillna(0).astype(int)

df = df.drop_duplicates(subset=["date", "location"])

df.to_csv(CLEAN_PATH, index=False)

print("Clean total dataset saved:", CLEAN_PATH)