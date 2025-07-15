#!/bin/bash

NAMESPACE="prod-galaxy"
POD_NAME="boson-deployment-d8bfb94f8-v7mv5"
CONTAINER_NAME="boson-app"
TIMESTAMP=$(TZ="Asia/Kolkata" date +'%Y%m%d_%H%M%S')
POD_FILE_PATH="/tmp/thread-dump-${POD_NAME}-${TIMESTAMP}.txt"
LOCAL_FILE_PATH="thread-dump-${POD_NAME}-${TIMESTAMP}.txt"

kubectl exec -n $NAMESPACE $POD_NAME -c $CONTAINER_NAME -- sh -c "jcmd 1 Thread.print > $POD_FILE_PATH"
kubectl exec -n $NAMESPACE $POD_NAME -c $CONTAINER_NAME -- cat $POD_FILE_PATH > $LOCAL_FILE_PATH
kubectl exec -n $NAMESPACE $POD_NAME -c $CONTAINER_NAME -- sh -c "rm -f $POD_FILE_PATH"