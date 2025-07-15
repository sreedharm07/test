#!/bin/bash
ADDRESS="http://localhost:9000"
TENANT_ID="hope-cluster-dev"
RULES_FILE="mimir-rules.yaml"

# Extract all rule group names and namespaces
yq e '.groups[] | [.namespace, .name] | @tsv' "$RULES_FILE" | while IFS=$'\t' read -r namespace group; do
    echo "Deleting rule group: $group from namespace: $namespace"
    mimirtool rules delete --address=$ADDRESS --id=$TENANT_ID "$namespace" "$group"
done