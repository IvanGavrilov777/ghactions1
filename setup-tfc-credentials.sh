#!/bin/bash
set -euo pipefail

# Ensure the environment variable TFC_TOKEN is set
if [ -z "${TFC_TOKEN:-}" ]; then
  echo "Error: TFC_TOKEN environment variable is not set"
  exit 1
fi

# Create the Terraform config directory if it doesn't exist
mkdir -p ~/.terraform.d

# Write the credentials file
cat > ~/.terraform.d/credentials.tfrc.json <<EOF
{
  "credentials": {
    "app.terraform.io": {
      "token": "${TFC_API_TOKEN}"
    }
  }
}
EOF

# Secure the file
chmod 600 ~/.terraform.d/credentials.tfrc.json

echo "Terraform Cloud credentials file has been created at ~/.terraform.d/credentials.tfrc.json"
