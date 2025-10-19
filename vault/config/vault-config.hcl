disable_mlock = true
ui = true

storage "file" {
  path = "/vault/file"
}

# Only configure an HTTPS listener
listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_cert_file = "/vault/certs/fullchain.pem"
  tls_key_file  = "/vault/certs/privkey.pem"
}

# Force the Vault API to use HTTPS
api_addr = "https://vault.siaploulis.com:8200"

#  set the cluster address to use HTTPS as well
cluster_addr = "https://vault.siaploulis.com:8201"
