terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}


resource "digitalocean_droplet" "sample" {
  name    = var.name
  region  = var.region
  size    = var.size
  image   = var.image
  ssh_keys = var.ssh_key_ids
}

# resource "digitalocean_floating_ip" "sample" {
#   count  = var.assign_floating_ip ? 1 : 0
#   region = digitalocean_droplet.sample.region
# }

# resource "digitalocean_floating_ip_assignment" "sample" {
#   count       = var.assign_floating_ip ? 1 : 0
#   floating_ip = digitalocean_floating_ip.sample[0].ip_address
#   droplet_id  = digitalocean_droplet.sample.id
# }
