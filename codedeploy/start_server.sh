#!/bin/bash
source /home/ec2-user/web/.env

$(aws ecr get-login --no-include-email --region $REGION)

cd /home/ec2-user/web/ && /usr/local/bin/docker-compose -f docker-compose.yml up -d
