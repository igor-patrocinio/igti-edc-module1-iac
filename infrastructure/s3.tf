# HASHCORP CONFIGURATION LANGUAGE - HCL - define quais recursos serão subidos para nuvem

resource "aws_s3_bucket" "datalake-igti" {
    # Parâmetros de configuração do recurso definido
    bucket = "datalake-igor-igti-edc-tf3"
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

