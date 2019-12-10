# Live Streaming Server
[![LICENSE](https://img.shields.io/github/license/tsunematsu21/template-nuxt-ts?color=green)](LICENSE)

## Pre-requisites

* **[Docker](https://www.docker.com/)**  
  A container platform.

## Getting started

Provision AWS resources by [Terraform](https://www.terraform.io/).

```bash
# Set environment variables
$ export AWS_ACCESS_KEY_ID="<YOUR_AWS_ACCESS_KEY_ID>"
$ export AWS_SECRET_ACCESS_KEY="<YOUR_AWS_SECRET_ACCESS_KEY>"
$ export AWS_DEFAULT_REGION="<YOUR_AWS_DEFAULT_REGION>"
$ export PUBLIC_KEY="<YOUR_PUBLIC_KEY>"

# Provision AWS resources
$ docker-compose run --rm terraform init
$ docker-compose run --rm terraform plan
$ docker-compose run --rm terraform apply
```
