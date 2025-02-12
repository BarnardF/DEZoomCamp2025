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

