import pandas as pd
from sqlalchemy import create_engine

# Database connection URL
db_url = "postgresql://root:root@localhost:5432/ny_taxi"
engine = create_engine(db_url)

# Chunk size to read in batches
chunk_size = 1000000

# Path to the CSV file
csv_file = "/workspaces/DEZoomCamp2025/module_1/week1_basics_n_setup/1_docker_sql/data/yellow_tripdata_2021-01.csv"

# Reading the data in chunks and inserting into the database
for chunk in pd.read_csv(csv_file, chunksize=chunk_size):
    # Renaming columns to match the database schema
    chunk.rename(columns={
        'VendorID': 'vendorid',
        'tpep_pickup_datetime': 'tpep_pickup_datetime',
        'tpep_dropoff_datetime': 'tpep_dropoff_datetime',
        'passenger_count': 'passenger_count',
        'trip_distance': 'trip_distance',
        'RatecodeID': 'ratecodeid',
        'store_and_fwd_flag': 'store_and_fwd_flag',
        'PULocationID': 'pulocationid',
        'DOLocationID': 'dolocationid',
        'payment_type': 'payment_type',
        'fare_amount': 'fare_amount',
        'extra': 'extra',
        'mta_tax': 'mta_tax',
        'tip_amount': 'tip_amount',
        'tolls_amount': 'tolls_amount',
        'improvement_surcharge': 'improvement_surcharge',
        'total_amount': 'total_amount',
        'congestion_surcharge': 'congestion_surcharge'
    }, inplace=True)

    # Converting date columns to datetime
    chunk['tpep_pickup_datetime'] = pd.to_datetime(chunk['tpep_pickup_datetime'])
    chunk['tpep_dropoff_datetime'] = pd.to_datetime(chunk['tpep_dropoff_datetime'])

    # Load chunk into the database
    chunk.to_sql("yellow_taxi_trips", engine, if_exists="append", index=False)
    
    print(f"✅ Loaded {len(chunk)} rows...")

print("🎯 Data successfully loaded in batches!")
