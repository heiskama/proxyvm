# Proxy VM / SOCKS v5 proxy

```shell
# Generate a new ssh key, no passphrase, no comment
ssh-keygen -t rsa -b 2048 -v -f mykey.pem -N '' -C ''

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
ssh -i mykey.pem -D 8080 username@public_ip

# Configure SOCKS v5 proxy in browser:
# localhost:8080

# Clean up
terraform destroy
az logout
```
