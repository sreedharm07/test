#!/bin/bash

BUCKET_NAME="prod-workspace-private-bucket"
FILE_PATH="aws.txt"
AWS_PROFILE="prodv3"



while IFS= read -r object_key
do
  aws s3 ls "s3://$BUCKET_NAME"
  aws s3 rm "s3://$BUCKET_NAME/$object_key" --profile prodv3
done < "$FILE_PATH"