[![Docker Repository on Quay](https://quay.io/repository/v1k0d3n/consul/status "Docker Repository on Quay")](https://quay.io/repository/v1k0d3n/fed-dev)

# Fed-Dev: Portable Fedora/Ansible Development Container for Deploying "Terransikube"
I created the fed-dev container for the use of deployment of Terransikube. Terransikube has been originally taken from the github/kubernetes/contrib/ansible repository, and in it's current form, "terransikube" is a work in progress. The good news is that as of today, one of the deployment works as directed in the following link: ## placeholder: documentation currently in progress ##

# Running Fed-Dev
Fed-Dev was created to run easily, although there are no exposed ports (you will need to connect via 'docker exec' command). It's made simply for development purposes; get in, work, launch your infrastructure, get out and destroy the container (along with any temporary credentials used for your IaaS deployment).

### Run the container
```
docker pull quay.io/v1k0d3n/fed-dev
docker run -itd <container-id> /bin/bash
```

### Notes on Security
This container should pass vulnerability CVE checks.

### Fair Warning
*It's not meant to be light, but it's meant to be used and abused, and then kicked to the curb when you're done (I know, it sounds so heartless)!*

I'll warn you ahead of time: This is not intended to be a lightweight container. This container is meant to be an ephemeral development container. You develop with it, push your IaaC to your cloud provider, and it allows you the freedom to develop without having to install prerequisites on your local machine.

As a great example (taking my upcoming Terransiform deployment of Kubernetes): If I want to run the openstack clients, which I can do just fine on an OSX host, *and* I want to use the ansible deployment from kubernetes/contrib which requires the "python-netaddr" package, this container could be used as an ephemeral Fedora host which I can destroy afterwards. You want to put creds in the contianer and blow it away layer? Fine. Just know going into this that layers 1, 5-6 are going to be around 200MB+, so be patient.

### Further Documentation
I add some Hashicorp packages to the container:
Packer: https://packer.io/
Vagrant: https://www.vagrantup.com/
Terraform: https://terraform.io/

and others:
Ansible: http://docs.ansible.com/ansible/intro_installation.html
Openstack-CLI Tools: http://docs.openstack.org/user-guide/common/cli_install_openstack_command_line_clients.html

I recommend reading up on Hashicorp products (I can't say enough good things about them) and Ansible. These tools are changing the way we deploy infrastructure today, and if you want a massive career boost check them out!
