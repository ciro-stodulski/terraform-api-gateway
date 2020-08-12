#!/bin/sh

ENV="dev"


if [ "$1" = "prod" ]; then
    ENV="prod"
fi

terraform fmt

terraform init

terraform plan -var-file="${ENV}/variables.tfvars" -out="plan.tfout"

terraform apply plan.tfout

rm -rf plan.tfout
