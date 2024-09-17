# Proxy VM / SOCKS v5 proxy

```shell
# Authenticate
az login --use-device-code
az account set --name "name of my subscription"

# Configure settings:
# variables.tf

# Create Proxy VM
terraform apply

# Check IP
terraform output
terraform state show azurerm_public_ip.pip

# Create SSH tunnel
ssh -D 8080 username@public_ip

# Configure SOCKS v5 proxy in browser:
# localhost:8080

# Clean up
terraform destroy
az logout
```
