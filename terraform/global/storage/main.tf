terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

resource "digitalocean_droplet" "storage" {
  name    = var.name
  region  = var.region
  size    = var.size
  image   = var.image
  ssh_keys = var.ssh_key_ids

  tags = ["nfs-server", "terraform"]

  user_data = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y nfs-kernel-server
    mkdir -p /srv/nfs/share
    chown nobody:nogroup /srv/nfs/share
    echo "/srv/nfs/share *(rw,sync,no_subtree_check)" >> /etc/exports
    exportfs -a
    systemctl restart nfs-kernel-server
  EOF

}