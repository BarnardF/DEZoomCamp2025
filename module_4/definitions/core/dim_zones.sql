config {
  type: "table",
  schema: "core",
  description: "Dimension table for taxi zones"
}

SELECT 
    locationid,
    borough,
    zone,
    service_zone
FROM trips_data_all.taxi_zone_lookup  -- This references your zones lookup table
