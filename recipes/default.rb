#
# Cookbook Name:: sys-utils
# Recipe:: default
#
# Copyright 2010, Cramer Development, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

case node[:platform]
when "ubuntu","debian"
  %w{ sysv-rc-conf ack-grep }.each do |pkg|
    package pkg
  end
when "centos","redhat"
  %w{ ack }.each do |pkg|
    package pkg
  end
end

# Common packages
%w{ pwgen rlwrap unzip zip }.each do |pkg|
  package pkg
end

# Gems
%w{ json rake rb-readline repl }.each do |pkg|
  gem_package pkg
end

# Ohai  & chef gems
# TODO: Replace this with chef-client cookbook
gem_package "ohai" do
  version node[:chef][:ohai_version]
end

gem_package "chef" do
  version node[:chef][:client_version]
end
