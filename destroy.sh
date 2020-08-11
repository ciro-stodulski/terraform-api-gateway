#!/bin/sh

ENV= "dev"


if ["$1" = "prod"]; then
ENV = "prod"
fi


./api/terraform destroy -var-file="${ENV}/variables.tfvars"
rm -rf  ./api/terraform