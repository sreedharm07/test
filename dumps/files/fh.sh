

sum(container_memory_working_set_bytes{namespace="$namespace", pod=~"$pod",container="$app"}) by (pod) / sum(kube_pod_container_resource_requests{namespace="$namespace", pod=~"$pod",resource="memory",container="$app"}) by (pod)
sum(container_memory_working_set_bytes{namespace="$namespace", pod=~"$pod",container="$app"}) by (pod) / sum(kube_pod_container_resource_limits{namespace="$namespace", pod=~"$pod", unit="byte", container="$app"}) by (pod)

