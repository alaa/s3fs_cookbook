attr = node['s3fs_cookbook']

s3fs_cookbook_directory attr['directory'] do
  bucket attr['s3']['bucket']
  user attr['user']
end

