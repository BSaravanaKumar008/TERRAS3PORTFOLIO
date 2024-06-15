resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucketname
}
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.mybucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.mybucket.id
  acl    = "public-read"
}
resource "aws_s3_object" "index" {
    bucket       = aws_s3_bucket.mybucket.id
    key          = "indexx.html"
    source       = "indexx.html"
    acl          = "public-read"
    content_type = "text/html"
}

resource "aws_s3_object" "styles" {
    bucket       = aws_s3_bucket.mybucket.id
    key          = "style.css"
    source       = "style.css"
    acl          = "public-read"
    content_type = "text/css"
}

resource "aws_s3_object" "script" {
    bucket       = aws_s3_bucket.mybucket.id
    key          = "script.js"
    source       = "script.js"
    acl          = "public-read"
    content_type = "application/javascript"
}

resource "aws_s3_bucket_website_configuration" "website" {
    bucket = aws_s3_bucket.mybucket.id
    index_document {
        suffix = "indexx.html"
    }
    depends_on = [aws_s3_bucket_acl.example]
}
