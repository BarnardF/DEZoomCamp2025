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




## 🛠️ Challenges & How I Solved Them

| **Problem** | **How I Solved It** |
|------------|--------------------|
| `docker-compose up -d` failed because the port was already in use | Used `docker ps` to find running containers and `docker stop <container_id>` to free up the port |
| Data was not loading into PostgreSQL | Realized the column names in my table didn’t match the CSV headers, so I adjusted them in the Python script |
| Git was rejecting large files when committing | Used Git LFS to track large files and ignored unnecessary large database files |

