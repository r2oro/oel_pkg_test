#
# Cookbook Name:: oel_pkg_test
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

pkg_src_location = 'https://s3.amazonaws.com/solution-automation-folder/qualys'
pkg = 'qualys-cloud-agent.x86_64.rpm'
local_image = "#{Chef::Config['file_cache_path']}/#{pkg}"

remote_file 'qualys-cloud-agent-image' do
  path local_image
  source "#{pkg_src_location}/#{pkg}"
end

package 'qualys-cloud-agent' do
  source local_image
end
