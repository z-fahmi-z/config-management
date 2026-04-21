data "digitalocean_ssh_key" "cm_droplet_key" {
    name = "cm_droplet_key"
}

resource "digitalocean_droplet" "cm_webserver" {
    name   = "cm-webserver"
    image  = "ubuntu-24-04-x64"
    size   = "s-1vcpu-512mb-10gb"
    region = var.do_region
    ssh_keys = [data.digitalocean_ssh_key.cm_droplet_key.id]
} 