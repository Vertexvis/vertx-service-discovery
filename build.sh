#!/bin/bash


mvn -U clean compile package install -Dmaven.test.skip=true -Dmaven.repo.local=./m2
aws s3 --profile ops cp m2/io/vertx/vertx-service-discovery/ s3://vertex-code-ops-us-west-2/m2/release/io/vertx/vertx-service-discovery/ --recursive --exclude _remote.repositories
