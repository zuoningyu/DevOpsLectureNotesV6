# Using Lambda with API Gateway

Create an execution role
------------------------

Create an [execution role](https://docs.aws.amazon.com/lambda/latest/dg/lambda-intro-execution-role.html). This AWS Identity and Access Management (IAM) role uses a custom policy to give your Lambda function permission to access the required AWS resources. Note that you must first create the policy and then create the execution role.

**To create a custom policy**

1.  Open the [Policies page](https://console.aws.amazon.com/iam/home#/policies)

4.  of the IAM console.

5.  Choose **Create Policy**.

6.  Choose the **JSON** tab, and then paste the following custom policy into the JSON editor.

1.  ```
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Sid": "Stmt1428341300017",
          "Action": [
            "dynamodb:DeleteItem",
            "dynamodb:GetItem",
            "dynamodb:PutItem",
            "dynamodb:Query",
            "dynamodb:Scan",
            "dynamodb:UpdateItem"
          ],
          "Effect": "Allow",
          "Resource": "*"
        },
        {
          "Sid": "",
          "Resource": "*",
          "Action": [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
          ],
          "Effect": "Allow"
        }
      ]
    }
    ```

    This policy includes permissions for your function to access DynamoDB and Amazon CloudWatch Logs.

2.  Choose **Next: Tags**.

3.  Choose **Next: Review**.

4.  Under **Review policy**, for the policy **Name**, enter `lambda-apigateway-policy`.

5.  Choose **Create policy**.

**To create an execution role**

1.  Open the [Roles page](https://console.aws.amazon.com/iam/home#/roles)

1.  of the IAM console.

2.  Choose **Create role**.

3.  For the type of trusted entity, choose **AWS service**.

4.  For the use case, choose **Lambda**.

5.  Choose **Next: Permissions**.

6.  In the policy search box, enter `lambda-apigateway-policy`.

7.  In the search results, select the policy that you created (`lambda-apigateway-policy`), and then choose **Next: Tags**.

8.  Choose **Next: Review**.

9.  Under **Review**, for the **Role name**, enter `lambda-apigateway-role`.

10. Choose **Create role**.

11. On the **Roles** page, choose the name of your role (`lambda-apigateway-role`).

12. On the **Summary** page, copy the **Role ARN**. You need this later in the tutorial.


Test the function
-----------------

Test the Lambda function manually using the following sample event data. You can invoke the function using the `invoke` AWS CLI command or by [using the Lambda console](https://docs.aws.amazon.com/lambda/latest/dg/configuration-function-common.html#configuration-common-test).

**To test the Lambda function (AWS CLI)**

1.  Save the following JSON as a file named `input.txt`.

19. ```
    {
        "operation": "echo",
        "payload": {
            "somekey1": "somevalue1",
            "somekey2": "somevalue2"
        }
    }
    ```

20. Run the following `invoke` AWS CLI command:

1.  ```
    aws lambda invoke --function-name hello-world-python\
    --payload file://input.txt outputfile.txt
    ```

    The **cli-binary-format** option is required if you are using AWS CLI version 2. You can also configure this option in your [AWS CLI config file](https://docs.aws.amazon.com/cli/latest/userguide/cliv2-migration.html#cliv2-migration-binaryparam).

2.  Verify the output in the file `outputfile.txt`.

Create a REST API using API Gateway
-----------------------------------

In this section, you create an API Gateway REST API (`DynamoDBOperations`) with one resource (`DynamoDBManager`) and one method (`POST`). You associate the `POST` method with your Lambda function. Then, you test the setup.

When your API method receives an HTTP request, API Gateway invokes your Lambda function.

### Create the API

In the following steps, you create the `DynamoDBOperations` REST API using the API Gateway console.

**To create the API**

1.  Open the [API Gateway console](https://console.aws.amazon.com/apigateway)

1.  .

2.  Choose **Create API**.

3.  In the **REST API** box, choose **Build**.

4.  Under **Create new API**, choose **New API**.

5.  Under **Settings**, do the following:

    1.  For **API name**, enter `DynamoDBOperations`.

    2.  For **Endpoint Type**, choose **Regional**.

6.  Choose **Create API**.

### Create a resource in the API

In the following steps, you create a resource named `DynamoDBManager` in your REST API.

**To create the resource**

1.  In the [API Gateway console](https://console.aws.amazon.com/apigateway)

1.  , in the **Resources** tree of your API, make sure that the root (`/`) level is highlighted. Then, choose **Actions**, **Create Resource**.

2.  Under **New child resource**, do the following:

    1.  For **Resource Name**, enter `DynamoDBManager`.

    2.  Keep **Resource Path** set to `/dynamodbmanager`.

3.  Choose **Create Resource**.

### Create a POST method on the resource

In the following steps, you create a `POST` method on the `DynamoDBManager` resource that you created in the previous section.

**To create the method**

1.  In the [API Gateway console](https://console.aws.amazon.com/apigateway)

1.  , in the **Resources** tree of your API, make sure that `/dynamodbmanager` is highlighted. Then, choose **Actions**, **Create Method**.

2.  In the small dropdown menu that appears under `/dynamodbmanager`, choose `POST`, and then choose the check mark icon.

3.  In the method's **Setup** pane, do the following:

    1.  For **Integration type**, choose **Lambda Function**.

    2.  For **Lambda Region**, choose the same AWS Region as your Lambda function.

    3.  For **Lambda Function**, enter the name of your function (`hello-world-python`).

    4.  Select **Use Default Timeout**.

    5.  Choose **Save**.

4.  In the **Add Permission to Lambda Function** dialog box, choose **OK**.

Create a DynamoDB table
-----------------------

Create the DynamoDB table that your Lambda function uses.

**To create the DynamoDB table**

1.  Open the [Tables page](https://console.aws.amazon.com/dynamodbv2#tables)

1.  of the DynamoDB console.

2.  Choose **Create table**.

3.  Under **Table details**, do the following:

    1.  For **Table name**, enter `lambda-apigateway`.

    2.  For **Partition key**, enter `id`, and keep the data type set as **String**.

4.  Under **Settings**, keep the **Default settings**.

5.  Choose **Create table**.

Test the setup
--------------

You're now ready to test the setup. You can send requests to your `POST` method directly from the API Gateway console. In this step, you use a `create` operation followed by an `update` operation.

**To create an item in your DynamoDB table**

Your Lambda function can use the `create` operation to create an item in your DynamoDB table.

1.  In the [API Gateway console](https://console.aws.amazon.com/apigateway)

44. , choose the name of your REST API (`DynamoDBOperations`).

45. In the **Resources** tree, under `/dynamodbmanager`, choose your `POST` method.

46. In the **Method Execution** pane, in the **Client** box, choose **Test**.

47. In the **Method Test** pane, keep **Query Strings** and **Headers** empty. For **Request Body**, paste the following JSON:

1.  ```
    {
      "operation": "create",
      "tableName": "lambda-apigateway",
      "payload": {
        "Item": {
          "id": "1234ABCD",
          "number": 5
        }
      }
    }
    ```

2.  Choose **Test**.

The test results should show status `200`, indicating that the `create` operation was successful. To confirm, you can check that your DynamoDB table now contains an item with `"id": "1234ABCD"` and `"number": "5"`.

**To update the item in your DynamoDB table**

You can also update items in the table using the `update` operation.

1.  In the [API Gateway console](https://console.aws.amazon.com/apigateway)

51. , return to your POST method's **Method Test** pane.

52. In the **Method Test** pane, keep **Query Strings** and **Headers** empty. In **Request Body**, paste the following JSON:

1.  ```
    {
        "operation": "update",
        "tableName": "lambda-apigateway",
        "payload": {
            "Key": {
                "id": "1234ABCD"
            },
            "AttributeUpdates": {
                "number": {
                    "Value": 10
                }
            }
        }
    }
    ```

2.  Choose **Test**.

The test results should show status `200`, indicating that the `update` operation was successful. To confirm, you can check that your DynamoDB table now contains an updated item with `"id": "1234ABCD"` and `"number": "10"`.

