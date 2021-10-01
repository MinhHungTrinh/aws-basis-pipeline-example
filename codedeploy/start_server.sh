#!/bin/bash
source /home/ec2-user/co-jp/docker/.env

$(aws ecr get-login --no-include-email --region $REGION)
if [ "$ENVIRONMENT" = "stg" ] || [ "$ENVIRONMENT" = "prod" ] || [ "$ENVIRONMENT" = "staging" ] || [ "$ENVIRONMENT" = "production" ]
then
    cd /home/ec2-user/co-jp/ && SERVICE_NAME=$SERVICE_NAME /usr/local/bin/docker-compose -f docker/docker-compose.yml up -d
fi

if [[ "$DEPLOYMENT_GROUP_NAME" == *"dev"* ]]
then
    cd /home/ec2-user/co-jp/ && SERVICE_NAME=$SERVICE_NAME /usr/local/bin/docker-compose -f docker/docker-compose-dev.yml up -d
fi