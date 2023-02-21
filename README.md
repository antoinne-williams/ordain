# Project Ordain

The Ordain project is designed to declaratively facilitate rapid provisioning of environments for development and operations with a variety of tools to accommodate source control management, infrastructure-as-code, build automation, configuration management, and container technologies. Base OS builds are also available.

### Supported Configuration

This section serves as a soft prerequisites guide. It covers the configuration used to test and validate the solutions within this repo, but does not list exact requirements since many configurations can be used with varying degrees of success.
- Ubuntu 18.04
- Oracle Virtualbox 5.2.34
- Vagrant 2.2.7 (Plugins: virtualbox 0.8.6)

### Included Tools

The tools servers within this repo currently include the following:

**Source Control Management**


- Git


**Configuration Management**


- Ansible


**Server Provisioning**


- Terraform


**Programming Languages**


- Java (OpenJDK 8 JDK)


**Build Automation Tools**


- Maven


**Container Management and Orchestration**


- Docker
- Kubectl
- Minikube

### Recommended Plugin Usage

There are a number of useful plugins for Vagrant and this project includes a script that can be used to quickly install them. This section includes usage options for some of those plugins.

- vagrant-disksize
```
Vagrantfile example:

Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/xenial64'
  config.disksize.size = '50GB'
end
```
Original documentation available here: https://github.com/sprotheroe/vagrant-disksize

- vagrant-env
```
Vagrantfile example:

Vagrant.configure("2") do |config|
  config.env.enable # enable the plugin
  config.vm.box = ENV['BOX_NAME']
end
```
Original documentation available here: https://github.com/gosuri/vagrant-env

- vagrant-scp
```
CLI example:

# Copy file from Vagrant host to Vagrant guest
vagrant scp </path/to/file_or_dir> [vm_name]:</path/to/file_or_dir>

# Copy file from Vagrant guest to Vagrant host
vagrant scp [vm_name]:</path/to/file_or_dir> </path/to/file_or_dir>

vagrant global-status can be used to list Vagrant VMs
```
Original documentation available here: https://github.com/invernizzi/vagrant-scp

- vagrant-sshfs
```
Vagrantfile example:

config.vm.synced_folder "/path/on/host", "/path/on/guest",
    ssh_opts_append: "-o Compression=yes -o CompressionLevel=5",
    sshfs_opts_append: "-o auto_cache -o cache_timeout=115200",
    disabled: false, type: "sshfs"
```
Original documentation available here: https://github.com/dustymabe/vagrant-sshfs
