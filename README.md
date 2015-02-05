# S3 Server Shared Bucket

Installs and Mounts S3 user-space file-system on Debian/Ubuntu using Fuse.

### S3 user information:
```
user: s3_buckets_user
bucket: shared-bucket-name
key: aws-key-id
secret: aws-secret-key
```

### S3 user policy:
```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": [
        "arn:aws:s3:::shared-bucket-name",
        "arn:aws:s3:::shared-bucket-name/*"
      ]
    }
  ]
}
```

### Tested on debian-7.0 and ubuntu-14.10
```
kitchen converge -c 2
kitchen verify
```
