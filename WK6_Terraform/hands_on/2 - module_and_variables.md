# Module
A module is a container for multiple resources that are used together.

Every Terraform configuration has at least one module, known as its root module, which consists of the resources defined in the .tf files in the main working directory.

A module can call other modules, which lets you include the child module's resources into the configuration in a concise way. Modules can also be called multiple times, either within the same configuration or in separate configurations, allowing resource configurations to be packaged and re-used.

Modules
- subdirctories with self-contained terraform code
- may be sourced from Git, etc.
- use variables and outputs to pass data

# Variables
Variables - Input variables serve as parameters for a Terraform module, allowing aspects of the module to be customized without altering the module's own source code, and allowing modules to be shared between different configurations.

# Version Control
Let us change the main.js to print `Hello World` and upload to s3 v1.0.1 folder

```
$ cd staging
$ zip example.zip main.js
$ aws s3 cp example.zip s3://terraform-serverless-jrdevops-holly/v1.0.1/example.zip
```

Create variables.tf in `./services/backend_app` and Add the following:
```
variable "app_version" {
}
```

Go to lambda.tf and change the `s3_key` in `aws_lambda_function` to
```
resource "aws_lambda_function" "example" {
  function_name = "ServerlessExample"

  # The bucket name as created earlier with "aws s3api create-bucket"
  s3_bucket = "terraform-serverless-jrdevops-holly"
  s3_key    = "v${var.app_version}/example.zip"
  # (leave the remainder unchanged)
}
```

The terraform apply command now requires a version number to be provided:
```
terraform apply -var="app_version=1.0.1"
```

Note: If you don't specify a version, terraform will ask you.

After the change has been applied, visit again the test URL and you should see the updated greeting message.

###Rollback

```
terraform apply -var="app_version=1.0.0"
```

###Destroy

```
terraform destroy -var="app_version=1.0.0"
```
