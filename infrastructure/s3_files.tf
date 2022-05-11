resource "aws_s3_bucket_object" "codigo_spark" {
    bucket = aws_s3_bucket.datalake-igti.id
    key = "emr-code/pyspark_job_spark_from_tf.py"
    acl = "private"
    source = "../process_spark.py"
    etag = filemd5("../process_spark.py")
}