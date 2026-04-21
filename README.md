# About

This is the deployment for the static web game [Void Runner](https://github.com/z-fahmi-z/void-runner) primarily using Ansible, Nginx, Terraform and DigitalOcean.

### App Demo
<video src="https://github.com/user-attachments/assets/95334f64-71df-4091-a3ff-35b196d3302e" controls></video

## Prerequisites

| Tool | Minimum Version | Install |
|---|---|---|
| Terraform | 1.14+ | [Terraform installation](https://developer.hashicorp.com/terraform/install) |
| Ansible | 2.16+ | Ansible installation with [pip](https://docs.ansible.com/projects/ansible/latest/installation_guide/intro_installation.html#pip-install) or [apt](https://docs.ansible.com/projects/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-ubuntu) |
| DigitalOcean | NaN | [DigitalOcean registration ](https://cloud.digitalocean.com/login) |


## Setup

1. Clone the repo 

```bash
git clone https://github.com/z-fahmi-z/config-management.git
cd config-management
```
2. Configure Terraform (DigitalOcean)
   
```bash
# Copy the .tfvars.example into .tfvars file
cp digitalocean/terraform.tfvars.example digitalocean/terraform.tfvars

# Edit the .tfvars values with your DigitalOcean credentials and local filesystem
nano digitalocean/terraform.tfvars
```

3. Configure Ansible

> [!NOTE]
> If you want your inventory.ini to have different names, you can configure it in `ansible.cfg`

```bash
# Copy the .ini.example into inventory.ini file
cp inventory.ini.example inventory.ini

# Edit the .ini values with your server configurations and local filesystem
nano inventory.ini

# Configure your local SSH public key path for Ansible control node in ./group_vars/all.yml 
nano group_vars/all.yml
```

4. Provision infrastructure with Terraform (DigitalOcean)
```bash
# From project root
cd digitalocean
terraform init
terraform plan
terraform apply
```

5. Copy the outputted public ip address of the Linux server into `inventory.ini`
```bash
# Expected output
...
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

cm_webserver_public_ip = "<copy-this-ip-into-inventory-ini-webserver-config>"
...
```

6. Run Ansible `setup.yml` playbook
```bash
# From /digitalocean directory
cd ..

# Run setup.yml playbook with all roles
ansible-playbook setup.yml
```

7. Play void-runner under the URL `http://<your-remote-server-public-ip>/index.html`

> [!TIP]
> If your home router blacklisted the DigitalOcean IPs due to your ISP policy or region, you can bypass them with a VPN. 

8. Destroy infrastructure
```bash
# From project root
cd digitalocean
terraform destroy
```

## Objectives

The primary goals for this project are:
- Handling and automate [config managements](https://roadmap.sh/projects/configuration-management) with Ansible.
- Automate [infrastructure provisioning](https://roadmap.sh/projects/iac-digitalocean) with Terraform.
- Utilize cloud providers like DigitalOcean, AWS or Azure.

### Todos
- [ ] add AWS IaC support.
- [ ] add Azure IaC support.
- [ ] build a pipeline for automation.