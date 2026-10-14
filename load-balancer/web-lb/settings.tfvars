# ===========================================================================
#  Load balancer SETTINGS.
#
#  To create a new load balancer, copy this whole "load-balancer-configs"
#  folder to a new name (that name becomes the load balancer's id), e.g.:
#      cp -r load-balancer-configs acme
#  then fill in acme/settings.tfvars, acme/pools.tfvars, acme/monitor.tfvars.
# ===========================================================================

# ---- WHERE (required) ----
account_id = "b1d2a86cbf7d5358135fe2674a27b717" # Cloudflare Account ID
zone_id    = "3941206acdf7fff732a48ce7b17f7946" # Zone ID of the domain below

# ---- LOAD BALANCER SETTINGS (required) ----
load_balancer = {
  name    = "tflb.origin.kushlearn.in" # the public hostname to serve
  proxied = true             # true = proxied/orange-cloud | false = DNS-only

  # off | random | geo | dynamic_latency | proximity | least_outstanding_requests | least_connections
  steering_policy = "random"

  # none | cookie | ip_cookie | header   (requires proxied = true)
  session_affinity = "ip_cookie"

  default_pool_keys = ["main"] # keys from pools.tfvars, in priority order
  fallback_pool_key = "main"   # used when everything else is unhealthy
}
