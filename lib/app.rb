require 'aws-sdk-s3'

region = "us-east-1"
bucket_name = "bucket01"
key_name = "key01"

Aws.config.update(
  endpoint: "http://localstack:4566",
  access_key_id: "test",
  secret_access_key: "test",
  region: region,
  force_path_style: true
)

client = Aws::S3::Client.new

# バケットを作成
client.create_bucket(bucket: bucket_name)
p client.list_buckets

# オブジェクトを作成
client.put_object(bucket: bucket_name, key: key_name, body: "Hello World")

# オブジェクトを読み込み
p client.get_object(bucket: bucket_name, key: key_name).body.read

# オブジェクト情報一覧
p client.list_objects_v2(bucket: bucket_name)
