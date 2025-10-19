#!/bin/sh

# Check if Vault is already running
if [ "$(vault status -format=json | jq -r .initialized)" = "true" ]; then
    echo "Vault is already initialized. Skipping initialization."
    exit 0
fi

# Clean up any existing Vault data
echo "Cleaning up existing Vault data..."
rm -rf /vault/file/*

# Start Vault server with configuration and run Vault server as bg process
echo "Starting Vault server..."
vault server -config=/vault/config/vault-config.hcl &

# Set Vault environment variables
export VAULT_ADDR='https://vault.siaploulis.com:8200'

# Capture the Vault server process ID
VAULT_PID=$!

# Initialize Vault
INIT_OUTPUT=$(vault operator init -key-shares=1 -key-threshold=1 -format=json)
VAULT_UNSEAL_KEY=$(echo "$INIT_OUTPUT" | jq -r .unseal_keys_b64[0])
VAULT_ROOT_TOKEN=$(echo "$INIT_OUTPUT" | jq -r .root_token)

#ait for Vault to be ready
#echo "Waiting for Vault to be ready..."
#while ! curl -k --silent --fail https://vault.siaploulis.com:8200/v1/sys/seal-status; do
   # echo "Waiting for Vault..."
   # sleep 1
#done

#export the vault token
export VAULT_TOKEN="$VAULT_ROOT_TOKEN"


# Unseal Vault
vault operator unseal "$VAULT_UNSEAL_KEY"

# Apply the kv policy
vault policy write kv-policy /vault/policies/kv-policy.hcl


# Now Vault is ready, proceed with initialization
echo "Vault is ready. Proceeding with initialization..."

# Run the apply-policies script
/apply-policies.sh

# Keep the script running to prevent container from exiting
wait $VAULT_PID