#!/bin/sh

ENV="develop"


if [ "$1" = "master" ]; then
    ENV="master"
fi

terraform fmt

terraform init

terraform plan -var-file="${ENV}/variables.tfvars" -out="plan.tfout"

terraform apply plan.tfout

rm -rf plan.tfout
