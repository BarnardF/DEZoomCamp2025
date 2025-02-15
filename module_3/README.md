<h1>Module 3: Data Warehousing with BigQuery</h1>

<h2>Overview</h2>

Module 3 introduced me to data warehousing principles and BigQuery, Google Cloud's serverless, scalable data warehouse. In this module, I explored partitioning and clustering techniques to optimize query performance and reduce costs. I also learned best practices for working with BigQuery and how to structure data for better performance and scalability.


<h2>Key Concepts & Learning</h2>
In this module, I focused on understanding and applying key concepts related to BigQuery:

    - Partitioning: Dividing large datasets into smaller, manageable chunks based on a column (e.g., time or date).
    - Clustering: Organizing data within partitions to speed up query performance by minimizing the amount of data scanned.
    - BigQuery Best Practices: Implemented strategies such as filtering on partitioned columns and optimizing query patterns to reduce costs and improve performance.


<h3>Deploying Machine Learning Model from BigQuery</h3>
One of the highlights of this module was deploying a machine learning model from BigQuery. I ran into some challenges related to using a Linux-based environment for this, but I found a helpful blog that guided me through the process: Deploying the Model from BigQuery. This resource helped me solve the issues and deploy the model successfully.


<h2>Challenges & Solutions</h2>
While partitioning and clustering were relatively straightforward, my biggest challenge came when deploying a machine learning model from BigQuery. Here’s how I tackled it:

| Challenge | How I Solved It |
|-----------|-----------------|
| Deploying a model in a Linux environment | Followed the steps outlined in this blog [Deploying the Model from BigQuery](https://dev.to/cmcrawford2/deploying-the-model-from-bigquery-3d56) to address environment-specific issues and successfully deploy the model. |
| Model deployment complications | The blog provided a detailed walkthrough of how to set up the deployment pipeline from BigQuery to a Docker container. While I was only able to receive a prediction for the tip amount through the terminal and not the localhost port, It worked! |


<h2>Software & Tools Used</h2>

| Tool | Purpose |
|------|---------|
| **Codespaces** | Cloud-based development environment |
| **BigQuery** | Data warehousing and analytics |
| **Google Cloud Storage (GCS)** | Used for storing raw and processed data |
| **Docker** | Containerization for model deployment |
| **Git & GitHub** | Version control & repository management |
