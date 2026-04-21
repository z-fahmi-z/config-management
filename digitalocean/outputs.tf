output "cm_webserver_public_ip" {
    description = "Public IP address of the cm_webserver droplet"
    value = module.compute.cm_webserver_public_ip
}