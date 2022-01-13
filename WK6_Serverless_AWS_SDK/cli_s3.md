# Manage S3 buckets and objectws using AWS CLI

Create a bucket
---------------

Use the [`s3 mb`](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/s3/mb.html) command to make a bucket. Bucket names must be ***globally*** unique (unique across all of Amazon S3) and should be DNS compliant.

Bucket names can contain lowercase letters, numbers, hyphens, and periods. Bucket names can start and end only with a letter or number, and cannot contain a period next to a hyphen or another period.

**Syntax**

```
$ aws s3 mb <target> [--options]
```


List buckets and objects
------------------------

To list your buckets, folders, or objects, use the [`s3 ls`](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/s3/ls.html) command. Using the command without a target or options lists all buckets.

**Syntax**

```
$ aws s3 ls <target> [--options]
```


Delete buckets
--------------

To delete a bucket, use the [`s3 rb`](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/s3/rb.html) command.

**Syntax**

```
$ aws s3 rb <target> [--options]
```


Copy objects
------------

Use the [`s3 cp`](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/s3/cp.html) command to copy objects from a bucket or a local directory.

**Syntax**

```
$ aws s3 cp <source> <target> [--options]
```


**s3 cp examples**

The following example copies all objects from `s3://bucket-name/example` to `s3://my-bucket/`.

```
$ aws s3 cp s3://bucket-name/example s3://my-bucket/
```

The following example copies a local file from your current working directory to the Amazon S3 bucket with the `s3 cp` command.

```
$ aws s3 cp filename.txt s3://bucket-name
```

The following example copies a file from your Amazon S3 bucket to your current working directory, where `./` specifies your current working directory.

```
$ aws s3 cp s3://bucket-name/filename.txt ./
```

The following example uses echo to stream the text "hello world" to the `s3://bucket-name/filename.txt` file.

```
$ echo "hello world" | aws s3 cp - s3://bucket-name/filename.txt
```

The following example streams the `s3://bucket-name/filename.txt` file to `stdout` and prints the contents to the console.

```
$ aws s3 cp s3://bucket-name/filename.txt -
hello world
```

The following example streams the contents of `s3://bucket-name/pre` to `stdout`, uses the `bzip2` command to compress the files, and uploads the new compressed file named `key.bz2` to `s3://bucket-name`.

```
$ aws s3 cp s3://bucket-name/pre - | bzip2 --best | aws s3 cp - s3://bucket-name/key.bz2
```

