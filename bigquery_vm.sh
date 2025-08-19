#!/bin/bash
set -e

# ========================
# CONFIGURATION VARIABLES
# ========================
PROJECT_ID=$(gcloud config get-value project)
ZONE="europe-west4-c"
INSTANCE_NAME="bigquery-instance"
MACHINE_TYPE="n1-standard-1"
IMAGE_FAMILY="debian-11"
IMAGE_PROJECT="debian-cloud"
DISK_NAME="bigquery-disk"
DISK_SIZE="10GB"

echo "🚀 Using Project: $PROJECT_ID"
echo "🚀 Zone: $ZONE"

# ========================
# CREATE VM INSTANCE
# ========================
echo "🚀 Creating a VM instance named '${INSTANCE_NAME}' in zone ${ZONE}..."

gcloud compute instances create "$INSTANCE_NAME" \
    --project="$PROJECT_ID" \
    --zone="$ZONE" \
    --machine-type="$MACHINE_TYPE" \
    --image-family="$IMAGE_FAMILY" \
    --image-project="$IMAGE_PROJECT" \
    --boot-disk-size="$DISK_SIZE" \
    --boot-disk-name="$DISK_NAME"

echo "✅ VM '${INSTANCE_NAME}' created successfully in zone ${ZONE}."
