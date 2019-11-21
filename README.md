# modules_skills_map_tf
This Repo contains TF example code for modules


## What is this repo for

This repository contains information on how to use modules in Terraform
This is helpfull in order to follow the DRY(Do not Repeat Yourself) methodology.
To do this you specify the path to the module you need to reuse like so
```
module "my-module" {
  source = "./my-modules/"

}
```

`./my-module/` is the path to the module.


## How to use this repo

To use this repo you need to download the files and use `terraform init` to run the main.tf file in the main directory.
After downloading the necessary provider plugins, run `terraform plan` and if all seems good run `terraform apply`.
This will deploy the resources that are specified in  module by calling it with  `module "my-module"`
