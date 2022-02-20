# Homework

## Question 1
In the first handon [1 - s3_lamda_gateway_api.md](1%20-%20s3_lamda_gateway_api.md), you may notice that we manually create
S3 and copy file over it.
Can you write a terraform code block that creates the S3 bucket?

Your terraform code should handle the following:
- creates a new S3 bucket and upload the zip file into this bucket
- use the new S3 bucket in your lambda tf code
- make sure this S3 bucket and the file upload gets deployed before the lambda function

## Question 2
What would happen if we did not enforce S3 bucket to be created before the lambda function?

## Question 3
How do you determine the changes between two different deployments in the past?

## Question 4
IaC code is also code. Think about programming best practices. How can you test your terraform code?

## Question 5
Compare the deployments we have done using following tools:
- Jenkins
- Travis CI
- Terraform

What are the similarity? What are the differences?

## Question 6 (challenge)
Try to set up a Jenkins job/pipeline to run the terraform project in our hands on practice.

Take a note of following while you attempt this challenge:

- Do you decide to use Jenkins job or Jenkins pipeline? why?
- What steps have you taken to move this "local terraform deployment" onto Jenkins?
- What issues have you come across while setting up this Jenkins job/pipeline? How many of these issues are related to Jenkins and how many are Terraform? How do you fix these issues?
