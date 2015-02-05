require 'chef/mixin/shell_out'
require 'chef/mixin/command'

include Chef::Mixin::ShellOut
include Chef::Mixin::Command

action :mount do
  source = ::File.join(new_resource.mount_point, new_resource.directory_name)
  bucket = new_resource.bucket
  use_cache = new_resource.use_cache ? "-o use_cache=/tmp/cache" : ""
  allow_other = new_resource.allow_other ? "-o allow_other" : ""

  directory source do
    user new_resource.user
    group new_resource.user
    action :create
    not_if "test -d #{source}"
  end

  execute "sudo /usr/bin/s3fs #{use_cache} #{allow_other} #{bucket} #{source}" do
    user new_resource.user
    not_if "mountpoint #{source} | grep 'is a mountpoint'"
  end
end

action :umount do
  source = ::File.join(new_resource.mount_point, new_resource.directory_name)

  execute "sudo umount #{source}" do
    user "root"
    only_if "mountpoint #{source} | grep 'is not a mountpoint'"
  end
end

