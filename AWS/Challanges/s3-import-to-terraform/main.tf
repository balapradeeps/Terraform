resource "aws_s3_bucket" "storagebucket" {
   bucket = "minibob-tf-state"
}

data "aws_s3_bucket_policy" "bucket_policy" {
  bucket = "minibob-tf-state"
}
