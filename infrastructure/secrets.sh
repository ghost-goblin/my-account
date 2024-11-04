#!/bin/bash

APPLICATION_NAME="$1"
SECRET_ARN=$(aws secretsmanager get-secret-value --secret-id "$APPLICATION_NAME" --query ARN --output text)
SECRET_KEYS=$(aws secretsmanager get-secret-value --secret-id "$APPLICATION_NAME" --query SecretString --output text | jq 'keys' | tr -d '[],\n\t\r"')
ARRAY=()

for key in $SECRET_KEYS
do
  SECRET=$(jq -n --arg key "$key" --arg arn "$SECRET_ARN:$key::" '{"name": $ARGS.named["key"],"valueFrom": $ARGS.named["arn"]}' | tr -d '\n\t\r ')
  ARRAY+=($SECRET)
done

SECRET_LIST=$(echo "${ARRAY[@]}" | sed 's/ /,/g')
echo $SECRET_LIST
jq '.containerDefinitions[0].secrets += ['"$SECRET_LIST"']' infrastructure/taskdef.temp.json > taskdef.secrets.json
