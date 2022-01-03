# Using an Amazon S3 trigger to invoke a Lambda function

Create a bucket and upload a sample object
------------------------------------------

Create an Amazon S3 bucket and upload a test file to your new bucket. Your Lambda function retrieves information about this file when you test the function from the console.

**To create an Amazon S3 bucket using the console**

1.  Open the [Amazon S3 console](https://console.aws.amazon.com/s3)

2.  Choose **Create bucket**.

3.  Under **General configuration**, do the following:

    1.  For **Bucket name**, enter a unique name.

    2.  For **AWS Region**, choose a Region. Note that you must create your Lambda function in the same Region.

4.  Choose **Create bucket**.

After creating the bucket, Amazon S3 opens the **Buckets** page, which displays a list of all buckets in your account in the current Region.

**To upload a test object using the Amazon S3 console**

1.  On the [Buckets page](https://console.aws.amazon.com/s3/home) of the Amazon S3 console, choose the name of the bucket that you created.

2.  On the **Objects** tab, choose **Upload**.

3.  Drag a test file from your local machine to the **Upload** page.

4.  Choose **Upload**.


Test in the console
-------------------

Invoke the Lambda function manually using sample Amazon S3 event data.

**To test the Lambda function using the console**

1.  On the **Code** tab, under **Code source**, choose the arrow next to **Test**, and then choose **Configure test events** from the dropdown list.

2.  In the **Configure test event** window, do the following:

    1.  Choose **Create new test event**.

    2.  For **Event template**, choose **Amazon S3 Put** (**s3-put**).

    3.  For **Event name**, enter a name for the test event. For example, `mys3testevent`.

    4.  In the test event JSON, replace the S3 bucket name (`example-bucket`) and object key (`test/key`) with your bucket name and test file name. Your test event should look similar to the following:

21. 1.  ```
        {
          "Records": [
            {
              "eventVersion": "2.0",
              "eventSource": "aws:s3",
              "awsRegion": "us-west-2",
              "eventTime": "1970-01-01T00:00:00.000Z",
              "eventName": "ObjectCreated:Put",
              "userIdentity": {
                "principalId": "EXAMPLE"
              },
              "requestParameters": {
                "sourceIPAddress": "127.0.0.1"
              },
              "responseElements": {
                "x-amz-request-id": "EXAMPLE123456789",
                "x-amz-id-2": "EXAMPLE123/5678abcdefghijklambdaisawesome/mnopqrstuvwxyzABCDEFGH"
              },
              "s3": {
                "s3SchemaVersion": "1.0",
                "configurationId": "testConfigRule",
                "bucket": {
                  "name": "my-s3-bucket",
                  "ownerIdentity": {
                    "principalId": "EXAMPLE"
                  },
                  "arn": "arn:aws:s3:::example-bucket"
                },
                "object": {
                  "key": "HappyFace.jpg",
                  "size": 1024,
                  "eTag": "0123456789abcdef0123456789abcdef",
                  "sequencer": "0A1B2C3D4E5F678901"
                }
              }
            }
          ]
        }
        ```

    2.  Choose **Create**.

22. To invoke the function with your test event, under **Code source**, choose **Test**.

    The **Execution results** tab displays the response, function logs, and request ID, similar to the following:

1.  ```
    Response
    "image/jpeg"

    Function Logs
    START RequestId: 12b3cae7-5f4e-415e-93e6-416b8f8b66e6 Version: $LATEST
    2021-02-18T21:40:59.280Z	12b3cae7-5f4e-415e-93e6-416b8f8b66e6	INFO	INPUT BUCKET AND KEY:  { Bucket: 'my-s3-bucket', Key: 'HappyFace.jpg' }
    2021-02-18T21:41:00.215Z	12b3cae7-5f4e-415e-93e6-416b8f8b66e6	INFO	CONTENT TYPE: image/jpeg
    END RequestId: 12b3cae7-5f4e-415e-93e6-416b8f8b66e6
    REPORT RequestId: 12b3cae7-5f4e-415e-93e6-416b8f8b66e6	Duration: 976.25 ms	Billed Duration: 977 ms	Memory Size: 128 MB	Max Memory Used: 90 MB	Init Duration: 430.47 ms

    Request ID
    12b3cae7-5f4e-415e-93e6-416b8f8b66e6
    ```

Test with the S3 trigger
------------------------

Invoke your function when you upload a file to the Amazon S3 source bucket.

**To test the Lambda function using the S3 trigger**

1.  On the [Buckets page](https://console.aws.amazon.com/s3/home)
of the Amazon S3 console, choose the name of the source bucket that you created earlier.

28. On the **Upload** page, upload a few .jpg or .png image files to the bucket.

29. Open the [Functions page](https://console.aws.amazon.com/lambda/home#/functions) of the Lambda console.

31. Choose the name of your function.

32. To verify that the function ran once for each file that you uploaded, choose the **Monitor** tab. This page shows graphs for the metrics that Lambda sends to CloudWatch. The count in the **Invocations** graph should match the number of files that you uploaded to the Amazon S3 bucket.

    ![](https://docs.aws.amazon.com/lambda/latest/dg/images/metrics-functions-list.png)

    For more information on these graphs, see [Monitoring functions on the Lambda console](https://docs.aws.amazon.com/lambda/latest/dg/monitoring-functions-access-metrics.html).

33. (Optional) To view the logs in the CloudWatch console, choose **View logs in CloudWatch**. Choose a log stream to view the logs output for one of the function invocations.
