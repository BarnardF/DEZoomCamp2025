config {
    type: "view",
    schema: "mart",
    name: "dm_monthly_zone_revenue",
    description: "Aggregated monthly revenue statistics"
}

SELECT
  -- dimensions
  DATE_TRUNC(pickup_datetime, MONTH) AS revenue_monthly,
  pickup_borough,
  pickup_zone,
  -- revenue metrics
  COUNT(*) AS total_trips,
  AVG(fare_amount) AS avg_fare_amount,
  AVG(total_amount) AS avg_total_amount,
  SUM(fare_amount) AS total_fare_amount,
  SUM(extra) AS total_extra_amount,
  SUM(mta_tax) AS total_mta_tax_amount,
  SUM(tip_amount) AS total_tip_amount,
  SUM(tolls_amount) AS total_tolls_amount,
  SUM(improvement_surcharge) AS total_improvement_surcharge_amount,
  SUM(total_amount) AS total_revenue,
  -- additional metrics
  AVG(tip_amount) AS avg_tip_amount,
  AVG(tip_amount / NULLIF(fare_amount, 0)) * 100 AS avg_tip_percentage
FROM
  ${ref("fact_trips")}
GROUP BY
  1,
  2,
  3
ORDER BY
  1,
  2,
  3
