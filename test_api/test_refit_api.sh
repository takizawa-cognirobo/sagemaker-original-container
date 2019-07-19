curl -X POST -H 'Content-Type: application/json' https://mj7zbf78w0.execute-api.ap-northeast-1.amazonaws.com/dev/model/fit \
    -d '{"training_data_path": "https://s3-ap-northeast-1.amazonaws.com/ml-backend-sagemaker-test/input/sagemaker_train.csv",
    "model_output_path" : "s3://ml-backend-sagemaker-test/output/",
    "image_uri" : "592866289138.dkr.ecr.ap-northeast-1.amazonaws.com/sagemaker-lightgbm:latest",
    "job_id" : "refit-test-lightgbm-01",
    "hyper_parameters": {"user_model_path": "s3://ml-backend-sagemaker-test/pretrain_model/model.txt"},
    "metric_definitions": [
        {"Name" : "train_accuracy", "Regex": "train_accuracy=(.*?);"},
        {"Name" : "train_auc", "Regex": "train_auc=(.*?);"},
        {"Name" : "eval_accuracy", "Regex": "eval_accuracy=(.*?);"},
        {"Name" : "eval_auc", "Regex": "eval_auc=(.*?);"}
    ],
    "train_instance_count" : 2,
    "train_instance_type" : "ml.m4.xlarge"}'
