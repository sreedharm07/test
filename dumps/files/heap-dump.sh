#!/bin/bash

NAMESPACE="prod-galaxy"
POD_NAME="boson-deployment-d8bfb94f8-sb8c2"
CONTAINER_NAME="boson-app"
TIMESTAMP=$(TZ="Asia/Kolkata" date +'%Y%m%d_%H%M%S')
POD_FILE_PATH="/tmp/heap-dump-${POD_NAME}-${TIMESTAMP}.hprof"
LOCAL_FILE_PATH="heap-dump-${POD_NAME}-${TIMESTAMP}.hprof"

kubectl exec -n $NAMESPACE $POD_NAME -c $CONTAINER_NAME -- sh -c "jmap -dump:format=b,file=$POD_FILE_PATH 1"
kubectl exec -n $NAMESPACE $POD_NAME -c $CONTAINER_NAME -- cat $POD_FILE_PATH > $LOCAL_FILE_PATH
kubectl exec -n $NAMESPACE $POD_NAME -c $CONTAINER_NAME -- sh -c "rm -f $POD_FILE_PATH"