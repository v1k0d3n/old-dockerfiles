[![Docker Repository on Quay](https://quay.io/repository/v1k0d3n/consul/status "Docker Repository on Quay")](https://quay.io/repository/v1k0d3n/fed-dev)

# Fed-Dev: Portable Fedora/Ansible Development Container for Deploying "Terransikube"
I created the fed-dev container for the use of deployment of Terransikube. Terransikube has been originally taken from the github/kubernetes/contrib/ansible repository, and in it's current form, "terransikube" is a work in progress. The good news is that as of today, one of the deployment works as directed in the following link: ## placeholder: documentation currently in progress ##

# Running Fed-Dev
Fed-Dev was created to run easily, although there are no exposed ports. It's made simply for development purposes; get in, work, launch your infrastructure, get out and destroy the container (along with any temporary credentials used for your IaaS deployment).

### Run with Web-UI Enabled
```
docker run -d
```

### Notes on Security
This container should pass vulnerability CVE checks.

### Further Documentation
I add some Hashicorp packages to the container:
Packer:
Vagrant:
Terraform:

and others:
Ansible:

I recommend reading up on Hashicorp products (I can't say enough good things about them) and Ansible. These tools are changing the way we deploy infrastructure today, and if you want a massive career boost check them out!
