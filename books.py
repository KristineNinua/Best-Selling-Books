import pandas as pd
from sqlalchemy import create_engine
from dotenv import load_dotenv
import os

# Loads Variables from .env
load_dotenv()


# Read from environment
username = os.getenv("DB_USER")
password = os.getenv("DB_PASS")
host = os.getenv("DB_HOST")
port = os.getenv("DB_PORT")
database = os.getenv("DB_NAME")

engine = create_engine(f"mysql+pymysql://{username}:{password}@{host}:{port}/{database}")

# Load csv
df = pd.read_csv("best-selling-books.csv")

# Save to SQL
df.to_sql("books", engine, if_exists="replace", index=False)
