#!/bin/bash
source /home/ec2-user/co-jp/docker/.env

if [ "$ENVIRONMENT" = "stg" ] || [ "$ENVIRONMENT" = "prod" ] || [ "$ENVIRONMENT" = "staging" ] || [ "$ENVIRONMENT" = "production" ]
then
    docker stop $(docker ps -qa) || true
    docker system prune -f --volumes || true
fi

if [[ "$DEPLOYMENT_GROUP_NAME" == *"dev"* ]]
then
    docker stop $(docker ps -af name=$SERVICE_NAME -q) || true
    docker rm $(docker ps -af name=$SERVICE_NAME -q) || true
fi