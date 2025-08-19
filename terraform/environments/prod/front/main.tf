terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

module "front" {
  source = "../../../modules/server"

  name            = "front"
  region          = var.region
  size            = var.size
  image           = var.image
  ssh_key_ids     = var.ssh_key_ids
  assign_floating_ip = var.assign_floating_ip
}

resource "digitalocean_domain" "dns" {
  name = "aakhrif.site"
}

resource "digitalocean_record" "root" {
  domain = digitalocean_domain.dns.id
  type = "A"
  name = "www"
  value = digitalocean_droplet.front.ipv4_address
}
