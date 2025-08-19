output "droplet_id" {
  description = "The ID of the created droplet"
  value       = module.jenkins.droplet_id
}

output "droplet_ip" {
  description = "The public IPv4 address of the droplet"
  value       = module.jenkins.droplet_ip
}

# output "front_ip" {
#   value = module.front.droplet_ip
# }