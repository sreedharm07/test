> cat cfl-thread-dump.sh
#!/bin/bash

NAMESPACE="prod-cfl"
POD_NAME="gdz-deployment-545f68898f-b4zfl"
CONTAINER_NAME="gdz-app"
TIMESTAMP=$(TZ="Asia/Kolkata" date +'%Y%m%d_%H%M%S')
POD_FILE_PATH="/tmp/thread-dump-${POD_NAME}-${TIMESTAMP}.txt"
LOCAL_FILE_PATH="thread-dump-${POD_NAME}-${TIMESTAMP}.txt"

kubectl exec -n $NAMESPACE $POD_NAME -c $CONTAINER_NAME -- sh -c "jcmd 1 Thread.print > $POD_FILE_PATH"
kubectl exec -n $NAMESPACE $POD_NAME -c $CONTAINER_NAME -- cat $POD_FILE_PATH > $LOCAL_FILE_PATH
kubectl exec -n $NAMESPACE $POD_NAME -c $CONTAINER_NAME -- sh -c "rm -f $POD_FILE_PATH"

 ~/thread-heap-dump -----------------------------------------------------------------------------
> cat heap-dump.sh
#!/bin/bash

NAMESPACE="prod-cfl"
POD_NAME="gdz-deployment-6b6d8f9d67-5hwsv"
CONTAINER_NAME="gdz-app"
TIMESTAMP=$(TZ="Asia/Kolkata" date +'%Y%m%d_%H%M%S')
POD_FILE_PATH="/tmp/heap-dump-${POD_NAME}-${TIMESTAMP}.hprof"
LOCAL_FILE_PATH="heap-dump-${POD_NAME}-${TIMESTAMP}.hprof"

kubectl exec -n $NAMESPACE $POD_NAME -c $CONTAINER_NAME -- sh -c "jmap -dump:format=b,file=$POD_FILE_PATH 1"
kubectl exec -n $NAMESPACE $POD_NAME -c $CONTAINER_NAME -- cat $POD_FILE_PATH > $LOCAL_FILE_PATH
kubectl exec -n $NAMESPACE $POD_NAME -c $CONTAINER_NAME -- sh -c "rm -f $POD_FILE_PATH"


aws s3 cp s3://cfl-dump/gdz-deployment-545f68898f-b4zfl/23:30-11:12/thread-dump-gdz-deployment-545f68898f-b4zfl-20241211_233406.txt .