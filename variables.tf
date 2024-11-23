variable "s3_backend" {
  description = "Name of the backet"
  type        = string
}

variable "sse_algorithm" {
  description = "Algorithm for sse"
  type        = string
  default     = "AES256"
}

variable "db_backend" {
  description = "Dynamo db name"
  type        = string
}