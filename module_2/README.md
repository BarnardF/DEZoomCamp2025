<h1>Module 2: Workflow Orchestration with Kestra</h1>

<h2>Overview</h2>

Module 2 introduced me to Kestra, an open-source, event-driven orchestration platform that simplifies building both scheduled and event-driven workflows. It adopts Infrastructure as Code practices for data and process orchestration, enabling the creation of reliable workflows with just a few lines of YAML. Working with Kestra was both challenging and rewarding, as I learned how to orchestrate complex data workflows efficiently.

<h2>Setting Up Kestra in Codespaces</h2>
Since I’m using Codespaces as my development environment (running on Linux), I set up Kestra using Docker Compose. Here’s how I approached it:

<h3>Docker Compose Configuration:</h3>
I configured a single docker-compose.yml file to manage Kestra, its dedicated PostgreSQL database, the Zoomcamp DB, and pgAdmin.

Changes included:

    - A new volume for the Zoomcamp DB container.
    - Renaming the Zoomcamp DB container to avoid clashes with Kestra’s DB container.
    - Adding a depends_on condition to ensure Kestra was running before other services started.
    - Running pgAdmin on Port 8085 to avoid conflicts with Kestra, which uses Ports 8080 and 8081.

<h2>Building and Running Workflows</h2>
I created several YAML files to build and test various workflows, its advised to run everything using the condigured docker-compose.yml file to run all foolowing scripts within Kestra, delete any output if necesarry to run the following .yaml file to test anything:

    01_getting_started_data_pipeline.yaml
    02_postgres_taxi.yaml
    02_postgres_taxi_scheduled.yaml
    03_postgres_dbt.yaml
    04_gcp_kv.yaml
    05_gcp_setup.yaml
    06_gcp_taxi.yaml
    06_gcp_taxi_scheduled.yaml
    07_gcp_dbt.yaml

<h3>Local Pipeline (PostgreSQL & pgAdmin4)</h3>
I initially connected Kestra with PostgreSQL and pgAdmin4 for a local data pipeline. This allowed me to:

    - Ingest data into the local PostgreSQL database.
    - Monitor and manage data using pgAdmin4.
    - Schedule and automate workflows using Kestra’s event-driven approach.

<h3>Cloud Pipeline (Google Cloud Integration)</h3>
After the local pipeline was successfully running, I moved on to Google Cloud to create an ETL Pipeline with GCS and BigQuery:

    - Google Cloud Storage (GCS): Used for storing raw and processed data.
    - BigQuery: For data warehousing and analytics.
    - I ran workflows in Kestra to manage Scheduling and Backfills using BigQuery.
    - Transform Data with dbt and BigQuery in Kestra

<h2>Challenges & Solutions</h2>
Throughout this module, I encountered several challenges, particularly due to the Linux environment in Codespaces. Here’s how I tackled them:

| Challenge | How I Solved It |
|-----------|-----------------|
| `terraform apply` failed due to authentication issues | Set up a Google Cloud service account and configured authentication correctly |
| Google Cloud Key setup in Kestra's KV store was not working | Discovered a typo in my project ID from the GCS key after several test runs |


<h2>Software & Tools Used</h2>

| Tool | Purpose |
|------|---------|
| **Codespaces** | Cloud-based development environment |
| **Docker** | Containerization for PostgreSQL, pgAdmin, and Kestra |
| **PostgreSQL** | Database used for NYC Taxi dataset |
| **Kestra** | Orchestration platform for workflow automation |
| **Terraform** | Infrastructure as Code for cloud setup |
| **Google Cloud Platform (GCP)** | Cloud resources deployment |
| **Python** | Data ingestion scripts |
| **Git & GitHub** | Version control & repository management |


    
