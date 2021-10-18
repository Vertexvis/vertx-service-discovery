#!/bin/bash

apt-get update && apt-get install -y unzip
curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o /tmp/awscliv2.zip
unzip -q /tmp/awscliv2.zip -d /tmp/
/tmp/aws/install

mvn -U clean compile package install -Dmaven.test.skip=true -Dmaven.repo.local=./m2
aws s3 --profile ops cp m2/io/vertx/vertx-service-discovery-parent/ s3://vertex-code-ops-us-west-2/m2/release/io/vertx/vertx-service-discovery-parent/ --recursive --exclude _remote.repositories
aws s3 --profile ops cp m2/io/vertx/vertx-service-discovery-bridge-consul/ s3://vertex-code-ops-us-west-2/m2/release/io/vertx/vertx-service-discovery-bridge-consul/ --recursive --exclude _remote.repositories

rm -rf m2
mvn clean
