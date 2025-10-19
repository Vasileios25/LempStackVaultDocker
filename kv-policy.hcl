path "transit/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "my_data/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "v1/sys/unseal" {
 capabilities = ["create", "read", "update", "delete", "list"]

 }
path "/v1/sys/policies/acl/kv-policy" {
  #capabilities = ["create", "read", "update", "delete", "list"]

}
path "/v1/sys/auth/userpass" {
capabilities = ["create", "read", "update", "delete", "list"]

}