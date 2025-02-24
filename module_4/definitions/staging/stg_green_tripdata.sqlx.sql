config {
    type: "view",
    schema: "staging",
    description: "Cleaned green taxi trip data"
}

  -- Section 1: Configuration
  -- Section 2: Deduplication CTE
WITH
  tripdata AS (
  SELECT
    *,
    ROW_NUMBER() OVER(PARTITION BY VendorID, lpep_pickup_datetime) AS rn
  FROM
    trips_data_all.green_tripdata
  WHERE
    VendorID IS NOT NULL )
    -- Section 3: Main Transformation
SELECT
  -- identifiers
  GENERATE_UUID() AS tripid,
  --creates unique ID for each trip
  SAFE_CAST(VendorID AS INT64) AS vendorid,
  --converts to integer safely
  SAFE_CAST(RatecodeID AS INT64) AS ratecodeid,
  SAFE_CAST(PULocationID AS INT64) AS pickup_locationid,
  SAFE_CAST(DOLocationID AS INT64) AS dropoff_locationid,
  -- timestamps
  CAST(lpep_pickup_datetime AS TIMESTAMP) AS pickup_datetime,
  CAST(lpep_dropoff_datetime AS TIMESTAMP) AS dropoff_datetime,
  -- trip info
  store_and_fwd_flag,
  SAFE_CAST(passenger_count AS INT64) AS passenger_count,
  CAST(trip_distance AS NUMERIC) AS trip_distance,
  SAFE_CAST(trip_type AS INT64) AS trip_type,
  -- payment info
  CAST(fare_amount AS NUMERIC) AS fare_amount,
  CAST(extra AS NUMERIC) AS extra,
  CAST(mta_tax AS NUMERIC) AS mta_tax,
  CAST(tip_amount AS NUMERIC) AS tip_amount,
  CAST(tolls_amount AS NUMERIC) AS tolls_amount,
  CAST(improvement_surcharge AS NUMERIC) AS improvement_surcharge,
  CAST(total_amount AS NUMERIC) AS total_amount,
  COALESCE(SAFE_CAST(payment_type AS INT64), 0) AS payment_type,
  'Green' AS service_type
FROM
  tripdata
WHERE
  rn = 1
