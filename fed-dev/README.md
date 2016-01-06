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
Security is extremely important to me. You will notice that (at the time of writing) this container is flagged with one (1) false positive CVE. The CVE is a "bind" vulnerability at layer 1, although this is a false positive because I remove bind in later layers. Currently, I hate that scanners look at layers, and not at the total sum of the container as built. I'm sure this will change eventually, but I can assure you that bind isn't in this container so the container is not vulnerable to the single CVE as flagged by Clair on Quay.

### Further Documentation
I add some Hashicorp packages to the container:
Packer:
Vagrant:
Terraform:

and others:
Ansible:

I recommend reading up on Hashicorp products (I can't say enough good things about them) and Ansible. These tools are changing the way we deploy infrastructure today, and if you want a massive career boost check them out!
