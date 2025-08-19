output "droplet_id" {
  value = digitalocean_droplet.storage.id
}

output "droplet_ip" {
  value = digitalocean_droplet.storage.ipv4_address
}