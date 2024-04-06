require 'aws-sdk-s3'

region = "us-east-1"

Aws.config.update(
  endpoint: "http://localstack:4566",
  access_key_id: "test",
  secret_access_key: "test",
  region: region,
  force_path_style: true
)

client = Aws::S3::Client.new

client.create_bucket(bucket: "bucket01")
p client.list_buckets
