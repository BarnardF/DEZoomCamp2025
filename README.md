# Data Engineering ZoomCamp 2025
<h3>Codespace reminder for myself</h3>
![stopping and starting codespace in vscode](https://github.com/user-attachments/assets/b8b621a4-25ee-4983-a674-4e4ea9ef64b4)



![Data engineering zoomcamp](https://github.com/user-attachments/assets/f7b0ffc5-ab8d-4c1c-9887-b382aaf826b0)


    Week 1: Introduction & Prerequisites
    Week 2: Workflow Orchestration
    Week 3: Data Warehouse
    Week 4: Analytics engineering
    Week 5: Batch processing
    Week 6: Streaming
    Weeks 7, 8, 9: Project

<h1>Week 1</h1>
This is my setup for week 1 that worked for me(I am using codespace as my virtual environment)
Week 1 - Setting Up Docker & PostgreSQL

    Install Docker: Install Docker and verify it's running.
    Create docker-compose.yml: Configure PostgreSQL and pgAdmin services with Docker.
    Start Services: Use docker-compose up -d to start the services in the background.
    Verify Database: Connect to PostgreSQL and verify the ny_taxi database exists.
    Download Dataset: Download and extract the NYC taxi dataset.
    Create Table: Set up the yellow_taxi_trips table in PostgreSQL.
    Load Data: Write a Python script (load_data.py) to load data into PostgreSQL in chunks.
    Verify Data: Check that data has been successfully loaded into PostgreSQL by querying the row count.
