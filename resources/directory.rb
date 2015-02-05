actions :mount, :umount
default_action :mount

attribute :directory_name, :kind_of => String, :name_attribute => true

attribute :bucket, :kind_of => String
attribute :mount_point, :kind_of => String, :default => "/mnt"
attribute :user, :kind_of => String

attribute :allow_other, :kind_of => [TrueClass, FalseClass], :default => true
attribute :use_cache, :kind_of => [TrueClass, FalseClass], :default => true

