# Using AWS Lambda with Amazon EventBridge (CloudWatch Events)

In this tutorial, you do the following:

-   Create a Lambda function using the **lambda-canary** blueprint. You configure the Lambda function to run every minute. Note that if the function returns an error, Lambda logs error metrics to Amazon CloudWatch.

-   Configure a CloudWatch alarm on the `Errors` metric of your Lambda function to post a message to your Amazon SNS topic when AWS Lambda emits error metrics to CloudWatch. You subscribe to the Amazon SNS topics to get email notification. In this tutorial, you do the following to set this up:

    -   Create an Amazon SNS topic.

    -   Subscribe to the topic so you can get email notifications when a new message is posted to the topic.

    -   In Amazon CloudWatch, set an alarm on the `Errors` metric of your Lambda function to publish a message to your SNS topic when errors occur.

Prerequisites
-------------

This tutorial assumes that you have some knowledge of basic Lambda operations and the Lambda console. If you haven't already, follow the instructions in [Getting started with Lambda](https://docs.aws.amazon.com/lambda/latest/dg/getting-started-create-function.html) to create your first Lambda function.

Create a Lambda function
------------------------

1.  Sign in to the AWS Management Console and open the AWS Lambda console at <https://console.aws.amazon.com/lambda/>

1.  .

2.  Choose **Create function**.

3.  Choose **Use a blueprint**.

4.  Enter `canary` in the search bar. Choose the **lambda-canary** blueprint, and then choose **Configure**.

5.  Configure the following settings.

    -   **Name** -- `lambda-canary`.

    -   **Role** -- **Create a new role from AWS policy templates**.

    -   **Role name** -- `lambda-apigateway-role`.

    -   **Policy templates** -- **Simple microservice permissions**.

    -   **Rule** -- **Create a new rule**.

    -   **Rule name** -- `CheckWebsiteScheduledEvent`.

    -   **Rule description** -- `CheckWebsiteScheduledEvent trigger`.

    -   **Rule type** -- `Schedule expression`.

    -   **Schedule expression** -- `rate(1 minute)`.

    -   **Environment variables**

        -   **site** -- `https://docs.aws.amazon.com/lambda/latest/dg/welcome.html`.

        -   **expected** -- `What is AWS Lambda?`.

6.  Choose **Create function**.

EventBridge (CloudWatch Events) emits an event every minute, based on the schedule expression. The event triggers the Lambda function, which verifies that the expected string appears in the specified page. For more information on expressions schedules, see [Schedule expressions using rate or cron](https://docs.aws.amazon.com/lambda/latest/dg/services-cloudwatchevents-expressions.html).

Test the Lambda function
------------------------

Test the function with a sample event provided by the Lambda console.

1.  Open the [Functions page](https://console.aws.amazon.com/lambda/home#/functions)

1.  of the Lambda console.

2.  Choose the **lambda-canary** function.

3.  Choose **Test**.

4.  Create a new event using the **CloudWatch** event template.

5.  Choose **Create event**.

6.  Choose **Invoke**.

The output from the function execution is shown at the top of the page.

Create an Amazon SNS topic and subscribe to it
----------------------------------------------

Create an Amazon Simple Notification Service (Amazon SNS) topic to receive notifications when the canary function returns an error.

**To create a topic**

1.  Open the [Amazon SNS console](https://console.aws.amazon.com/sns/home)

1.  .

2.  Choose **Create topic**.

3.  Create a topic with the following settings.

    -   **Name** -- `lambda-canary-notifications`.

    -   **Display name** -- `Canary`.

4.  Choose **Create subscription**.

5.  Create a subscription with the following settings.

    -   **Protocol** -- `Email`.

    -   **Endpoint** -- Your email address.

Amazon SNS sends an email from `Canary <no-reply@sns.amazonaws.com>`, reflecting the friendly name of the topic. Use the link in the email to confirm your address.

Configure an alarm
------------------

Configure an alarm in Amazon CloudWatch that monitors the Lambda function and sends a notification when it fails.

**To create an alarm**

1.  Open the [CloudWatch console](https://console.aws.amazon.com/cloudwatch)

1.  .

2.  Choose **Alarms**.

3.  Choose **Create alarm**.

4.  Choose **Alarms**.

5.  Create an alarm with the following settings.

    -   **Metrics** -- **lambda-canary Errors**.

        Search for `lambda canary errors` to find the metric.

    -   Statistic -- `Sum`.

        Choose the statistic from the drop-down menu above the preview graph.

    -   **Name** -- `lambda-canary-alarm`.

    -   **Description** -- `Lambda canary alarm`.

    -   Threshold -- **Whenever Errors is >=**`1`.

    -   **Send notification to** -- `lambda-canary-notifications`.

Test the alarm
--------------

Update the function configuration to cause the function to return an error, which triggers the alarm.

**To trigger an alarm**

1.  Open the [Functions page](https://console.aws.amazon.com/lambda/home#/functions)

1.  of the Lambda console.

2.  Choose the **lambda-canary** function.

3.  Scroll down. Under **Environment variables**, choose **Edit**.

4.  Set **expected** to `404`.

5.  Choose **Save**.

Wait a minute, and then check your email for a message from Amazon SNS.

Clean up your resources
-----------------------

You can now delete the resources that you created for this tutorial, unless you want to retain them. By deleting AWS resources that you're no longer using, you prevent unnecessary charges to your AWS account.

**To delete the Lambda function**

1.  Open the [Functions page](https://console.aws.amazon.com/lambda/home#/functions)

1.  of the Lambda console.

2.  Select the function that you created.

3.  Choose **Actions**, then choose **Delete**.

4.  Choose **Delete**.

**To delete the CloudWatch alarm**

1.  Open the [Alarms page](https://console.aws.amazon.com/cloudwatch/home#alarms:)

1.  of the CloudWatch console.

2.  Select the alarm you created.

3.  Choose **Actions**, **Delete**.

4.  Choose **Delete**.

**To delete the Amazon SNS subscription**

1.  Open the [Subscriptions page](https://console.aws.amazon.com/sns/home#subscriptions:)

1.  of the Amazon SNS console.

2.  Select the subscription you created.

3.  Choose **Delete**, **Delete**.

**To delete the Amazon SNS topic**

1.  Open the [Topics page](https://console.aws.amazon.com/sns/home#topics:)

37. of the Amazon SNS console.

38. Select the topic you created.

39. Choose **Delete**.

40. Enter `delete me` in the text box.

41. Choose **Delete**.
