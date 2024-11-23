// s3 bucket
// dynamo db table - locking mechanims 

resource "aws_s3_bucket" "s3_backend" {
  bucket = var.bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.sse_algorithm
      }
    }
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = local.tags
}

resource "aws_dynamodb_table" "db_backend" {
  name           = var.dbnamodb_name # or var.dynamodb_table_name if renamed
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockId"

  attribute {
    name = "LockId"
    type = "S"
  }

  tags = local.tags
}


