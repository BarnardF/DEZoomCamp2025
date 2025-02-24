config {
    type: "table",
    schema: "core",
    name: "fact_trips",
    description: "Taxi trips with pickup and dropoff zone information"
}

WITH
  green_trips AS (
  SELECT
    tripid,
    vendorid,
    pickup_datetime,
    dropoff_datetime,
    store_and_fwd_flag,
    ratecodeid,
    pickup_locationid,
    dropoff_locationid,
    passenger_count,
    trip_distance,
    fare_amount,
    extra,
    mta_tax,
    tip_amount,
    tolls_amount,
    improvement_surcharge,
    total_amount,
    payment_type,
    trip_type,
    'Green' AS service_type
  FROM
    ${ref("stg_green_tripdata")} ),
  yellow_trips AS (
  SELECT
    tripid,
    vendorid,
    pickup_datetime,
    dropoff_datetime,
    store_and_fwd_flag,
    ratecodeid,
    pickup_locationid,
    dropoff_locationid,
    passenger_count,
    trip_distance,
    fare_amount,
    extra,
    mta_tax,
    tip_amount,
    tolls_amount,
    improvement_surcharge,
    total_amount,
    payment_type,
    NULL AS trip_type,
    'Yellow' AS service_type
  FROM
    ${ref("stg_yellow_tripdata")} ),
  trips_unioned AS (
  SELECT
    *
  FROM
    green_trips
  UNION ALL
  SELECT
    *
  FROM
    yellow_trips )
SELECT
  trips.*,
  pickup_zone.borough AS pickup_borough,
  pickup_zone.zone AS pickup_zone,
  pickup_zone.service_zone AS pickup_service_zone,
  dropoff_zone.borough AS dropoff_borough,
  dropoff_zone.zone AS dropoff_zone,
  dropoff_zone.service_zone AS dropoff_service_zone
FROM
  trips_unioned trips
LEFT JOIN
  ${ref("dim_zones")} pickup_zone
ON
  trips.pickup_locationid = pickup_zone.locationid
LEFT JOIN
  ${ref("dim_zones")} dropoff_zone
ON
  trips.dropoff_locationid = dropoff_zone.locationid
