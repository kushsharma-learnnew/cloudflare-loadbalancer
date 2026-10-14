# ===========================================================================
#  Origin POOLS and their ORIGINS (your backend servers).
#
#  Using PRIVATE IPs? Set virtual_network_id on each origin to the Cloudflare
#  virtual network (Magic WAN / Tunnel) that can reach those internal IPs.
#  Find it in the dashboard, or:  cloudflared tunnel vnet list
#  For PUBLIC IPs/hostnames, remove the virtual_network_id line.
# ===========================================================================
pools = {
  main = {
    name            = "uwa-try" # must be unique within your account
    minimum_origins = 1
    monitor_key     = "http" # references a key in monitor.tfvars

    origins = [
      {
        name               = "origin-4"
        address            = "10.190.0.56" # private IP of your backend
        port               = 80
        weight             = 1
        virtual_network_id = "0daf8596-4565-42ea-b5f6-364e9332e0ea" # required for private IPs
      },
      # {
      #   name               = "origin-5"
      #   address            = "10.190.0.57"
      #   port               = 80
      #   weight             = 1
      #   virtual_network_id = "0daf8596-4565-42ea-b5f6-364e9332e0ea"
      # },
      #       {
      #   name               = "origin-6"
      #   address            = "10.190.0.58"
      #   port               = 80
      #   weight             = 1
      #   virtual_network_id = "0daf8596-4565-42ea-b5f6-364e9332e0ea"
      # },
    ]
  }
}
