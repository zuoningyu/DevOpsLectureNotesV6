# Homework
1. Take your "hello world" lambda function and try to integrate it with following services as its trigger:
- AWS EventBridge (CloudWatch events)
- S3 upload event
- AWS API Gateway
2. Write two scripts, one in bash and one in python, that each implement the following feature: change Amazon EC2 Instance Type with a given instance ID, and a new instance type. Think about following before you start writing these scripts:
- what should be the input and output of your script?
- what is the workflow of your script?
- what are the corner cases of your workflow? e.g. what if input instance ID does not exist
- how would you design error handling in your script to handle these corner cases?
3. Deploy a Lambda function using AWS CLI, that scans and terminate EC2 instances without tag "Name=Protect, Value=True" on a daily basis, then send an email to yourself summarising the instances that has been terminated.
- You might want to manually build and test your lambda function first before you deploy it using CLI
- Consider sending email using AWS SNS: https://docs.aws.amazon.com/sns/latest/dg/sns-email-notifications.html
- How do you specify lambda run schedule in your AWS CLI command?
3. (Optional) Build a three-tier architecture using a Serverless architecture: AWS API Gateway and Lambda https://docs.aws.amazon.com/whitepapers/latest/serverless-multi-tier-architectures-api-gateway-lambda/three-tier-architecture-overview.html
