# HASHCORP CONFIGURATION LANGUAGE - HCL - define quais recursos serão subidos para nuvem

resource "aws_s3_bucket" "datalake-igti" {
    # Parâmetros de configuração do recurso definido
    bucket = "${var.base-bucket-name}-${var.ambiente}-${var.numero-conta}"
    acl = "private"

    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }

    tags = {
        "IES" = "IGTI"
        "CURSO" = "EDC"
    }
}

resource "aws_s3_bucket_object" "codigo_spark" {
    bucket = aws_s3_bucket.datalake-igti.id
    key = "emr-code/pyspark_job_spark_from_tf.py"
    acl = "private"
    source = "../process_spark.py"
    etag = filemd5("../process_spark.py")
}

provider "aws" {
    region = "us-east-2"
}