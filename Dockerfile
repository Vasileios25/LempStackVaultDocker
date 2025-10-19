# Use an appropriate base image
FROM hashicorp/vault:latest



# Install netcat for checking port availability
RUN apk add --no-cache netcat-openbsd jq curl

# Copy the initialization script into the container
COPY init-vault.sh /init-vault.sh
COPY apply-policies.sh /apply-policies.sh
COPY kv-policy.hcl /vault/policies/kv-policy.hcl

# Copy your Vault configuration file and .env file if needed
COPY /vault/config/vault-config.hcl /vault/
COPY .env /.env
COPY /vault/certs/fullchain.pem /vault/certs/fullchain.pem
COPY /vault/certs/privkey.pem /vault/certs/privkey.pem

#Change ownership to vault user and group
RUN chown vault:vault /init-vault.sh
RUN chown vault:vault /apply-policies.sh
RUN chown vault:vault /vault/policies/kv-policy.hcl


# Make the script executable
RUN chmod +x /init-vault.sh /apply-policies.sh

# Set the entrypoint to your script
ENTRYPOINT ["/init-vault.sh"]