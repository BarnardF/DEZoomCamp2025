<h1>Module 4: Analytics Engineering with Dataform</h1>

<h2>Overview</h2>
Module 4 introduced me to analytics engineering principles, though with a significant pivot from the original curriculum. While the module was designed for dbt (data build tool), I encountered persistent issues that led me to adopt Dataform as an alternative solution. This adaptation forced me to deeply understand the underlying concepts rather than simply following instructions. Working with Dataform was both challenging and rewarding as I learned how to transform raw data into trusted data models for analysis.


<h2>The Pivot to Dataform</h2>
After troubleshooting dbt integration issues for many hours without success, I made the strategic decision to pivot to Dataform:

<h3>Dataform Setup:</h3>

    - Set up a Dataform project in Google 
    - Connected it to my BigQuery instance
    - Configured the necessary settings to work with my existing data
    - Adapted the course materials to work with Dataform's syntax and structure
    
<h3>Adaptation Process:</h3>

    - Translated dbt concepts and workflows to Dataform equivalents
    - Restructured the project to align with Dataform's development approach
    - Modified SQL transformations to be compatible with Dataform's framework

<h2>Building Data Models</h2>
I successfully created a complete pipeline with various data models to transform the raw NYC Taxi data:

![dataform flow](https://github.com/user-attachments/assets/cb19791a-0001-4d38-aea5-7f41bbbfe05e)

<h4>Staging Layer (stg_):</h4>
stg_green_tripdata.sqlx and stg_yellow_tripdata.sqlx: These standardize and clean the raw taxi trip data from two different sources (green and yellow taxis). They ensure consistent column names and data types, making it easier to combine later.
dim_zones.sqlx: Creates a dimension table for NYC taxi zones, containing location reference data like borough and zone names.

<h4>Core Layer (fact_):</h4>
fact_trips.sqlx: This combines and transforms the cleaned green and yellow taxi data from the staging layer into a single, unified trips table. It joins with the zones dimension table to add location context to each trip.

<h4>Mart Layer (dm_):</h4>
dm_monthly_zone_revenue: This is the final analytical layer that aggregates the data for business insights. It calculates monthly revenue metrics by zone using the fact_trips table.

The flow is: Raw Data → Staging (cleaning) → Fact (combining) → Mart (analysis)

![analytics](https://github.com/user-attachments/assets/8f76694b-c064-4441-81b3-df958ad4d256)

<h2>Key Learnings</h2>

    - Building modular and reusable SQL using Dataform
    - Implementing data quality validation through assertions
    - Documenting data models for improved understanding
    - Following analytics engineering best practices
    - Applying version control to data transformation code
    - Optimizing warehouse performance through proper model structure
    - Creating a maintainable and scalable analytics framework
    - Adapting to challenges and finding alternative solutions

<h2>Project Architecture</h2>
The final architecture shows a clear lineage from raw data all the way to analytical views, with:

    - Raw data stored in BigQuery
    - Staging views for initial data cleaning
    - Core fact and dimension tables
    - Final data marts for analytics

