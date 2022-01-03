# Run a Serverless "Hello, World!"

## Enter the Lambda Console

When you click here, the AWS Management Console will open in a new browser window, so you can keep this step-by-step guide open.  Find Lambda under Compute and click to open the AWS Lambda Console.


## Select a Lambda Blueprint

Blueprints provide example code to do some minimal processing. Most blueprints process events from specific event sources, such as Amazon S3, DynamoDB, or a custom application.

a.  In the AWS Lambda console, select **Create a Function**.

Note: The console shows this page only if you do not have any Lambda functions created. If you have created functions already, you will see the *Lambda > Functions* page. On the list page, choose *Create a function* to go to the Create function page.

![Select Create a Function](https://d1.awsstatic.com/tmt/tmt_create-lambda-function/NewScreenshots2018/GIFFormat/P2.a226f9a8059d2ae59b0a308b5aae7832ea5b2ef0.gif "Select Create a Function")

b.  Select **Blueprints**.\
c.  In the Filter box, type in *hello-world-python* and select the hello-world-python blueprint.\
d.  Then click **Configure**.

## Configure and create your lambda function

A Lambda function consists of code you provide, associated dependencies, and configuration. The configuration information you provide includes the compute resources you want to allocate (for example, memory), execution timeout, and an IAM role that AWS Lambda can assume to execute your Lambda function on your behalf.

a. You will now enter *Basic Information* about your Lambda function.

**Basic Information:**

-   **Name**: You can name your Lambda function here. For this tutorial, enter *hello-world-python.*
-   **Role**: You will create an IAM role (referred as the execution role) with the necessary permissions that AWS Lambda can assume to invoke your Lambda function on your behalf. Select *Create new role from template(s).*
-   **Role name**: type *lambda_basic_execution*

**Lambda Function Code:**

-   In this section, you can review the example code authored in Python.

b. Go to the bottom of the page and select **Create Function**.

![Enter Lambda Basic Information](https://d1.awsstatic.com/tmt/tmt_create-lambda-function/NewScreenshots2018/GIFFormat/P4.6e6d2a47ae4ebc0dec93376742bfc586444a0059.gif "Enter Lambda Basic Information")

c.  **Runtime**: Currently, you can author your Lambda function code in Java, Node.js, C#, Go or Python. For this tutorial, leave this on *Python 3.7* as the runtime.

d.  **Handler**: You can specify a handler (a method/function in your code) where AWS Lambda can begin executing your code. AWS Lambda provides event data as input to this handler, which processes the event.

In this example, Lambda identifies this from the code sample and this should be pre-populated with *lambda_function.lambda_handler.*

![hello-world-python Configuration](https://d1.awsstatic.com/tmt/tmt_create-lambda-function/NewScreenshots2018/GIFFormat/P5.3fe5ac34d7fbb1838af4b7d793b71e0a079a7f05.gif "hello-world-python Configuration")

e.  Scroll down to configure your memory, timeout, and VPC settings.  For this tutorial, leave the default Lambda function configuration values.

![ Scroll down to configure your memory, timeout, and VPC settings](https://d1.awsstatic.com/tmt/tmt_create-lambda-function/NewScreenshots2018/GIFFormat/P6.d03bbaa333c047547fcdd73f9053c32cfc7a57d0.gif " Scroll down to configure your memory, timeout, and VPC settings")

## Invoke your lambda function and verify results

The console shows the hello-world-python Lambda function - you can now test the function, verify results, and review the logs.

a.  Select **Configure Test Event** from the drop-down menu called "Select a test event...".

![Select Configure Test Event from the drop-down menu](https://d1.awsstatic.com/tmt/tmt_create-lambda-function/NewScreenshots2018/GIFFormat/P7.7e81457a2dd43fa338c28a323ef502cd18156375.gif "Select Configure Test Event from the drop-down menu")

b.  The editor pops up to enter an event to test your function.  

-   Choose *Hello World* from the Sample event template list from the Input test event page. 
-   Type in an event name like *HelloWorldEvent*.
-   You can change the values in the sample JSON, but don't change the event structure. For this tutorial, replace *value1* with *hello, world!*.

Select **Create**.

![Configure Test Event](https://d1.awsstatic.com/tmt/tmt_create-lambda-function/NewScreenshots2018/GIFFormat/P8.dfb2802ce9ec29937f6b9b13ba5592f4b34b7215.gif "Configure Test Event")

c.  Select **Test**.

![Click on Test](https://d1.awsstatic.com/tmt/tmt_create-lambda-function/NewScreenshots2018/GIFFormat/P9.62c53faed303f11d1f576cb030c63b9787a252d6.gif "Click on Test")

d.  Upon successful execution, view the results in the console:

-   The **Execution results** section verifies that the execution succeeded.
-   The **Summary** section shows the key information reported in the Log output.
-   The **Log output** section will show the logs generated by the Lambda function execution.

![View the results in the console](https://d1.awsstatic.com/tmt/tmt_create-lambda-function/NewScreenshots2018/GIFFormat/P91.cfc4227c8cfabe4be6aa69ad41b2177a2374b8c8.gif "View the results in the console")


## Monitor your metrics

The console shows the hello-world-python Lambda function - you can now test the function, verify results, and review the logs.

a.  Select **Configure Test Event** from the drop-down menu called "Select a test event...".

![Select Configure Test Event from the drop-down menu](https://d1.awsstatic.com/tmt/tmt_create-lambda-function/NewScreenshots2018/GIFFormat/P7.7e81457a2dd43fa338c28a323ef502cd18156375.gif "Select Configure Test Event from the drop-down menu")

b.  The editor pops up to enter an event to test your function.  

-   Choose *Hello World* from the Sample event template list from the Input test event page. 
-   Type in an event namAWS Lambda automatically monitors Lambda functions and reports metrics through Amazon CloudWatch. To help you monitor your code as it executes, Lambda automatically tracks the number of requests, the latency per request, and the number of requests resulting in an error and publishes the associated metrics. 

a.  Invoke the Lambda function a few more times by repeatedly clicking the **Test** button.  This will generate the metrics that can be viewed in the next step.\
b.  Select **Monitoring** to view the results.

![Invoke the Lambda function a few more times by repeatedly clicking the Test button](https://d1.awsstatic.com/tmt/tmt_create-lambda-function/NewScreenshots2018/GIFFormat/P92.e9087ae7bd07866ee9251e3647511a2470a9af4c.gif "Invoke the Lambda function a few more times by repeatedly clicking the Test button")

c.  Scroll down to view the metrics for your Lambda function.  Lambda metrics are reported through Amazon CloudWatch. You can leverage these metrics to set custom alarms. For more information about CloudWatch, see the [Amazon CloudWatch Developer Guide](http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/WhatIsCloudWatch.html).

The Monitoring tab will show six CloudWatch metrics: *Invocation count, Invocation duration, Invocation errors, Throttled invocations, Iterator age, and DLQ errors.*

With AWS Lambda, you pay for what you use. After you hit your AWS Lambda free tier limit, you are charged based on the number of requests for your functions (invocation count) and the time your code executes (invocation duration).  For more information, see [AWS Lambda Pricing](https://aws.amazon.com/lambda/pricing/).

![The Monitoring tab will show six CloudWatch metrics](https://d1.awsstatic.com/tmt/tmt_create-lambda-function/NewScreenshots2018/GIFFormat/P93.9237157123db3392618ef1c5e012470b4e6ef95b.gif "The Monitoring tab will show six CloudWatch metrics")e like *HelloWorldEvent*.
-   You can change the values in the sample JSON, but don't change the event structure. For this tutorial, replace *value1* with *hello, world!*.

Select **Create**.

![Configure Test Event](https://d1.awsstatic.com/tmt/tmt_create-lambda-function/NewScreenshots2018/GIFFormat/P8.dfb2802ce9ec29937f6b9b13ba5592f4b34b7215.gif "Configure Test Event")

c.  Select **Test**.

![Click on Test](https://d1.awsstatic.com/tmt/tmt_create-lambda-function/NewScreenshots2018/GIFFormat/P9.62c53faed303f11d1f576cb030c63b9787a252d6.gif "Click on Test")

d.  Upon successful execution, view the results in the console:

-   The **Execution results** section verifies that the execution succeeded.
-   The **Summary** section shows the key information reported in the Log output.
-   The **Log output** section will show the logs generated by the Lambda function execution.

![View the results in the console](https://d1.awsstatic.com/tmt/tmt_create-lambda-function/NewScreenshots2018/GIFFormat/P91.cfc4227c8cfabe4be6aa69ad41b2177a2374b8c8.gif "View the results in the console")

