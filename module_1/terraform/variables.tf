variable "credentials" {
  description = "My credentials"
  default     = "<Path to your Service Account json file>"
}


variable "project" {
  description = "Project"
  default     = "<Your project ID>"
}

variable "region" {
  description = "Region"
  default     = "us-central1"
}

variable "location" {
  description = "Project Location"
  default     = "US"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "demo_dataset"
}

variable "gcs_bucket_name" {
  description = "My storage bucket name"
  default     = "taxi-rides-ny-449710-terra-bucket"
}

variable "gcs_storage_class" {
  description = "Bucket storage Class"
  default     = "STANDARD"

}
