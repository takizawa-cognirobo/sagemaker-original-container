curl -X POST -H 'Content-Type: application/json' https://gbw5y7qtf4.execute-api.ap-northeast-1.amazonaws.com/dev/model/start-batch-transform \
    -d '{"model_artifact_path":"s3://ml-backend-sagemaker-test/output/fit-test-lightgbm-01/output/model.tar.gz",
     "image_uri":"592866289138.dkr.ecr.ap-northeast-1.amazonaws.com/sagemaker-lightgbm:latest",
     "job_id":"test-batch-transform-lightgbm-01",
     "S3InputPath":"s3://ml-backend-sagemaker-test/pred/input/",
     "S3OutputPath":"s3://ml-backend-sagemaker-test/pred/output/",
     "instance_count":1,
     "instance_type":"ml.m4.xlarge"}'
