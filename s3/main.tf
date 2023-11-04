resource "aws_s3_bucket" "prod_media" {
  bucket = "bucket-nube"
}

resource "aws_s3_bucket_cors_configuration" "prod_media" {
  bucket = aws_s3_bucket.prod_media.id  

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "HEAD"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }  
}

resource "aws_s3_bucket_acl" "prod_media" {
    bucket = aws_s3_bucket.prod_media.id
    acl    = "public-read"
    depends_on = [aws_s3_bucket_ownership_controls.s3_bucket_acl_ownership]
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_acl_ownership" {
  bucket = aws_s3_bucket.prod_media.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
  depends_on = [aws_s3_bucket_public_access_block.example]
}

# resource "aws_iam_user" "prod_media_bucket" {
#   name = "prod-media-bucket"
# }

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.prod_media.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "prod_media_bucket" {
    bucket = aws_s3_bucket.prod_media.id
    policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Principal = "*"
        Action = [
          "s3:*",
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:s3:::bucket-nube",
          "arn:aws:s3:::bucket-nube/*"
        ]
      },
      {
        Sid = "PublicReadGetObject"
        Principal = "*"
        Action = [
          "s3:GetObject",
        ]
        Effect   = "Allow"
        Resource = [
          "arn:aws:s3:::bucket-nube",
          "arn:aws:s3:::bucket-nube/*"
        ]
      },
    ]
  })
  
  depends_on = [aws_s3_bucket_public_access_block.example]
}

resource "aws_s3_object" "upload" {
  for_each = fileset("uploads/", "*")
  bucket = aws_s3_bucket.prod_media.id
  key = each.value
  content_type = "text/html"
  source = "uploads/${each.value}"
  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  # etag = filemd5("path/to/file")
}