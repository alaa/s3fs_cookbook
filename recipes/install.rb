attr = node['s3fs_cookbook']

attr['packages'].each do |pkg|
  package pkg
end

installation_dir = "/opt/s3fs_source"

# TODO check the revision of the source
git installation_dir do
  repository attr['repo']
  revision attr['rev']
  action :sync
  not_if "which s3fs"

  notifies :run, "bash[compile_s3fs]", :immediately
end

bash "compile_s3fs" do
  cwd installation_dir

  code <<-EOH
   ./autogen.sh
   ./configure --prefix=/usr --with-openssl
   make
   sudo make install
  EOH

  action :nothing
end

file "/etc/passwd-s3fs" do
  content "#{attr['s3']['aws_key']}:#{attr['s3']['aws_secret']}"
  owner 'root'
  group 'root'
  mode '600'
end

#file "/etc/fstab" do
#  content "s3fs##{attr['s3']['bucket']} #{attr['s3']['mount_point']} fuse allow_other 0 0"
#  not_if "cat /etc/fstab | grep #{attr['s3']['bucket']}"
#end
#
#execute 'mount -a' do
#  not_if 'mount -l | grep s3fs'
#end
#
#file "/home/kitchen/s3/provisioned" do
#  content "provisioned via chef"
#end

