resource "aws_s3_bucket" "terraform-remote-state-storage-s3-holly" {
  bucket = "terraform-remote-state-storage-s3-holly"

  versioning {
    enabled = true
  }

}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name         = "terraform-state-lock-dynamodb"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}