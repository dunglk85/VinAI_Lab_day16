output "load_balancer_ip" {
  description = "External IP address of the Load Balancer (API endpoint)"
  value       = google_compute_global_forwarding_rule.vllm_fwd.ip_address
}

output "api_endpoint" {
  description = "vLLM API endpoint URL"
  value       = "http://${google_compute_global_forwarding_rule.vllm_fwd.ip_address}/v1"
}

output "cpu-node_name" {
  description = "Name of the CPU Compute Engine instance"
  value       = google_compute_instance.cpu-node.name
}

output "cpu-node_zone" {
  description = "Zone of the CPU instance"
  value       = google_compute_instance.cpu-node.zone
}

output "ssh_command" {
  description = "Command to SSH into the CPU node via IAP"
  value       = "gcloud compute ssh ${google_compute_instance.cpu-node.name} --zone=${google_compute_instance.cpu-node.zone} --tunnel-through-iap"
}
