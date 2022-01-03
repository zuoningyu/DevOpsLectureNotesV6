# Use Boto3 with Amazon DynamoDB

Creating a new table
--------------------

In order to create a new table, use the [`DynamoDB.ServiceResource.create_table()`](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/dynamodb.html#DynamoDB.ServiceResource.create_table "DynamoDB.ServiceResource.create_table") method:
```
import boto3

# Get the service resource.
dynamodb = boto3.resource('dynamodb')

# Create the DynamoDB table.
table = dynamodb.create_table(
    TableName='users',
    KeySchema=[
        {
            'AttributeName': 'username',
            'KeyType': 'HASH'
        },
        {
            'AttributeName': 'last_name',
            'KeyType': 'RANGE'
        }
    ],
    AttributeDefinitions=[
        {
            'AttributeName': 'username',
            'AttributeType': 'S'
        },
        {
            'AttributeName': 'last_name',
            'AttributeType': 'S'
        },
    ],
    ProvisionedThroughput={
        'ReadCapacityUnits': 5,
        'WriteCapacityUnits': 5
    }
)

# Wait until the table exists.
table.meta.client.get_waiter('table_exists').wait(TableName='users')

# Print out some data about the table.
print(table.item_count)
```
Expected output:
```
0
```
This creates a table named `users` that respectively has the hash and range primary keys `username` and `last_name`. This method will return a [`DynamoDB.Table`](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/dynamodb.html#DynamoDB.Table "DynamoDB.Table") resource to call additional methods on the created table.

Using an existing table
-----------------------

It is also possible to create a [`DynamoDB.Table`](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/dynamodb.html#DynamoDB.Table "DynamoDB.Table") resource from an existing table:
```
import boto3

# Get the service resource.
dynamodb = boto3.resource('dynamodb')

# Instantiate a table resource object without actually
# creating a DynamoDB table. Note that the attributes of this table
# are lazy-loaded: a request is not made nor are the attribute
# values populated until the attributes
# on the table resource are accessed or its load() method is called.
table = dynamodb.Table('users')

# Print out some data about the table.
# This will cause a request to be made to DynamoDB and its attribute
# values will be set based on the response.
print(table.creation_date_time)
```
Expected output (Please note that the actual times will probably not match up):
```
2015-06-26 12:42:45.149000-07:00
```
Creating a new item
-------------------

Once you have a [`DynamoDB.Table`](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/dynamodb.html#DynamoDB.Table "DynamoDB.Table") resource you can add new items to the table using [`DynamoDB.Table.put_item()`](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/dynamodb.html#DynamoDB.Table.put_item "DynamoDB.Table.put_item"):
```
table.put_item(
   Item={
        'username': 'janedoe',
        'first_name': 'Jane',
        'last_name': 'Doe',
        'age': 25,
        'account_type': 'standard_user',
    }
)
```
For all of the valid types that can be used for an item, refer to [*Valid DynamoDB types*](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/customizations/dynamodb.html#ref-valid-dynamodb-types).

Getting an item
---------------

You can then retrieve the object using [`DynamoDB.Table.get_item()`](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/dynamodb.html#DynamoDB.Table.get_item "DynamoDB.Table.get_item"):
```
response = table.get_item(
    Key={
        'username': 'janedoe',
        'last_name': 'Doe'
    }
)
item = response['Item']
print(item)
```
Expected output:
```
{u'username': u'janedoe',
 u'first_name': u'Jane',
 u'last_name': u'Doe',
 u'account_type': u'standard_user',
 u'age': Decimal('25')}
```
Updating an item
----------------

You can then update attributes of the item in the table:
```
table.update_item(
    Key={
        'username': 'janedoe',
        'last_name': 'Doe'
    },
    UpdateExpression='SET age = :val1',
    ExpressionAttributeValues={
        ':val1': 26
    }
)
```
Then if you retrieve the item again, it will be updated appropriately:
```
response = table.get_item(
    Key={
        'username': 'janedoe',
        'last_name': 'Doe'
    }
)
item = response['Item']
print(item)
```
Expected output:
```
{u'username': u'janedoe',
 u'first_name': u'Jane',
 u'last_name': u'Doe',
 u'account_type': u'standard_user',
 u'age': Decimal('26')}
```
Deleting an item
----------------

You can also delete the item using [`DynamoDB.Table.delete_item()`](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/dynamodb.html#DynamoDB.Table.delete_item "DynamoDB.Table.delete_item"):
```
table.delete_item(
    Key={
        'username': 'janedoe',
        'last_name': 'Doe'
    }
)
```

Deleting a table
----------------

Finally, if you want to delete your table call [`DynamoDB.Table.delete()`](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/dynamodb.html#DynamoDB.Table.delete "DynamoDB.Table.delete"):
```
table.delete()
```
