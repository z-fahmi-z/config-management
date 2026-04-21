output "cm_webserver_public_ip" {
    value = digitalocean_droplet.cm_webserver.ipv4_address
}