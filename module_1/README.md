<h1>Module 1</h1>
This is my setup for module 1 that worked for me(I am using codespace as my virtual environment)

Setting Up Docker & PostgreSQL

    Install Docker: Install Docker and verify it's running.
    Create docker-compose.yml: Configure PostgreSQL and pgAdmin services with Docker.
    Start Services: Use docker-compose up -d to start the services in the background.
    Verify Database: Connect to PostgreSQL and verify the ny_taxi database exists.
    Download Dataset: Download and extract the NYC taxi dataset.
    Create Table: Set up the yellow_taxi_trips table in PostgreSQL.
    Load Data: Write a Python script (load_data.py) to load data into PostgreSQL in chunks.
    Verify Data: Check that data has been successfully loaded into PostgreSQL by querying the row count.

Terraform Setup & Cloud Integration

    Install Terraform: Set up Terraform CLI inside Codespaces.
    Create Terraform Files: Define infrastructure using main.tf, variables.tf, and provider.tf.
    Initialize Terraform: Run terraform init to download provider plugins.
    Plan & Apply: Execute terraform plan followed by terraform apply to provision cloud resources.
    Verify Cloud Resources: Ensure infrastructure is created successfully in Google Cloud.

Software & Tools Used

    Codespaces (Cloud-based development environment)
    Docker (Containerization for PostgreSQL & pgAdmin)
    PostgreSQL (Database used for NYC Taxi dataset)
    Terraform (Infrastructure as Code for cloud setup)
    Google Cloud Platform (GCP) (Cloud resources deployment)
    Python (For data ingestion scripts)
    Git & GitHub (Version control & repository management)


## 🛠️ Challenges & How I Solved Them

| **Problem** | **How I Solved It** |
|------------|--------------------|
| `docker-compose up -d` failed because the port was already in use(used in a test run) | Used `docker ps` to find running containers and `docker stop <container_id>` to free up the port |
| Data was not loading into PostgreSQL | Realized the column names in my table didn’t match the CSV headers, so I adjusted them in the Python script |
| Git was rejecting large files when committing | added large files to .gitignore |
| Terraform apply failed due to authentication issues | Set up a Google Cloud service account and configured authentication correctly |
| Not a chalange but just removed credential keys |

