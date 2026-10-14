# ===========================================================================
#  Load balancer SETTINGS.
#
#  To create a new load balancer, copy this whole "load-balancer-configs"
#  folder to a new name (that name becomes the load balancer's id), e.g.:
#      cp -r load-balancer-configs acme
#  then fill in acme/settings.tfvars, acme/pools.tfvars, acme/monitor.tfvars.
# ===========================================================================

# ---- WHERE (required) ----
account_id = "68e1253a502bd37e8feabeea38358543" # Cloudflare Account ID
zone_id    = "f32ea93ad0f2c31d8f59078ac1a5f036" # Zone ID of the domain below

# ---- LOAD BALANCER SETTINGS (required) ----
load_balancer = {
  name    = "lb.cf.trustedge.win" # the public hostname to serve
  proxied = true             # true = proxied/orange-cloud | false = DNS-only

  # off | random | geo | dynamic_latency | proximity | least_outstanding_requests | least_connections
  steering_policy = "random"

  # none | cookie | ip_cookie | header   (requires proxied = true)
  session_affinity = "ip_cookie"

  default_pool_keys = ["main"] # keys from pools.tfvars, in priority order
  fallback_pool_key = "main"   # used when everything else is unhealthy
}
