import pandas as pd

RAW_PATH = "data/raw/covid_jpn_prefecture.csv"
CLEAN_PATH = "data/clean/covid_jpn_prefecture.csv"

df = pd.read_csv(RAW_PATH, engine="python")

print("Original shape:", df.shape)

df = df.dropna(axis=1, how="all")

required_columns = [
    "Date",
    "Prefecture",
    "Positive",
    "Tested",
    "Discharged",
    "Fatal",
    "Hosp_require",
    "Hosp_severe"
]
df = df[required_columns]


df = df.rename(columns={
    "Date": "date",
    "Prefecture": "prefecture_name",
    "Positive": "positive",
    "Tested": "tested",
    "Discharged": "discharged",
    "Fatal": "fatal",
    "Hosp_require": "hosp_require",
    "Hosp_severe": "hosp_severe"
})


df["date"] = pd.to_datetime(df["date"])

numeric_cols = [
    "positive",
    "tested",
    "discharged",
    "fatal",
    "hosp_require",
    "hosp_severe"
]


for col in numeric_cols:
    df[col] = pd.to_numeric(df[col], errors="coerce").fillna(0).astype(int)


df = df.drop_duplicates(subset=["date", "prefecture_name"])

print("Cleaned shape:", df.shape)
df.to_csv(CLEAN_PATH, index=False)

print("Clean prefecture dataset saved:", CLEAN_PATH)