#!/bin/bash

# Define the paths for each AD configuration
AD_PATHS=("ad1" "ad2" "ad3")

# Start an infinite loop
while true; do
    for AD_PATH in "${AD_PATHS[@]}"; do
        echo "Attempting to create instance in configuration: $AD_PATH"

        # Navigate to the Terraform configuration directory
        cd "vm/$AD_PATH" || exit 1

        # Initialize Terraform
        terraform init -input=false

        # Attempt to apply the Terraform configuration
        terraform apply -auto-approve
        if [ $? -eq 0 ]; then
            echo "Instance successfully created in configuration: $AD_PATH"
            exit 0  # Exit the script on success
        else
            echo "Failed to create instance in configuration: $AD_PATH. Retrying next AD..."
        fi

	sleep 3

        # Go back to the root directory
        cd ../..
    done
done
