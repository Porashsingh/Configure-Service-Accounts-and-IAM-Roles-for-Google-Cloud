#!/bin/bash

# Variables
INSTANCE_NAME="bigquery-instance"
ZONE="europe-west4-c"
MACHINE_TYPE="e2-medium"
IMAGE_FAMILY="debian-11"
IMAGE_PROJECT="debian-cloud"
BOOT_DISK_NAME="bigquery-disk"

echo "🚀 Creating VM instance: $INSTANCE_NAME in $ZONE..."

gcloud compute instances create $INSTANCE_NAME \
  --zone=$ZONE \
  --machine-type=$MACHINE_TYPE \
  --image-family=$IMAGE_FAMILY \
  --image-project=$IMAGE_PROJECT \
  --boot-disk-device-name=$BOOT_DISK_NAME \
  --boot-disk-size=20GB

if [ $? -eq 0 ]; then
  echo "✅ VM instance '$INSTANCE_NAME' created successfully in zone $ZONE"
else
  echo "❌ Failed to create VM instance. Please check the error above."
fi
