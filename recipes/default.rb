remote_directory "/usr/local/src/shadow-1.4.1" do
  source 'shadow-1.4.1'
  not_if { File.exists?("#{node[:languages][:ruby][:bin_dir].gsub(/bin$/, "lib/ruby/site_ruby/1.9.1/")}#{node[:languages][:ruby][:platform]}/shadow.so") }
end

bash "install ruby shadow library" do
  user "root"
  cwd "/usr/local/src"
  code <<-EOH
  cd shadow-1.4.1
  ruby extconf.rb
  make install
  EOH
  not_if { File.exists?("#{node[:languages][:ruby][:bin_dir].gsub(/bin$/, "lib/ruby/site_ruby/1.9.1/")}#{node[:languages][:ruby][:platform]}/shadow.so") }
end