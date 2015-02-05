default["s3fs_cookbook"]["packages"] = 
%w[build-essential git libfuse-dev libcurl4-openssl-dev libxml2-dev mime-support
  automake libtool pkg-config libssl-dev]

default["s3fs_cookbook"]["repo"] = "https://github.com/s3fs-fuse/s3fs-fuse"
default["s3fs_cookbook"]["rev"] = "98daf166819bee2e292f5f1df0ba56c9237c7863"

default["s3fs_cookbook"]["user"] = "deployer"
default["s3fs_cookbook"]["mount_point"] = "/mnt"
default["s3fs_cookbook"]["directory"] = "s3"

default["s3fs_cookbook"]["s3"]["bucket"] = "s3-bucket-name"
default["s3fs_cookbook"]["s3"]["aws_key"] = "aws-key-id"
default["s3fs_cookbook"]["s3"]["aws_secret"] = "aws-secret-key"
