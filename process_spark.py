from pyspark.sql.functions import mean, max, min, col, count
from pyspark.sql import SparkSession


spark = (
    SparkSession.builder.appName('ExerciseSpark').
    getOrCreate()
)

enem = (
    spark
    .read
    .format('csv')
    .option('header', True)
    .option('inferSchema', True)
    .option('delimiter', ';')
    .load('s3://datalake-igor-igti-aula1/raw-data/enem/')
         )

(
    enem
    .write
    .mode('overwrite')
    .format('parquet')
    .partitionBy('year')
    .save('s3://datalake-igor-igti-aula1/staging/enem/')
)