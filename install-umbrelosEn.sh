#!/bin/bash

# VM configuration variables
VM_ID=999 # Change this number if you already have a VM with this ID
ISO_URL="https://download.umbrel.com/release/latest/umbrelos-amd64-usb-installer.iso" # Official URL of the UmbrelOS ISO
ISO_NAME="umbrelos-amd64-usb-installer.iso" # Name of the ISO file
STORAGE="local-lvm"
DISK_SIZE="920G" # VM disk size
CORES=4 # CPU cores
RAM=8192 # RAM memory
NET_BRIDGE="vmbr0" # Network configuration (you can adjust it according to your setup)

# Initial messages
echo "🚀 Starting the installation of UmbrelOS on a Proxmox VM..."

# Download the UmbrelOS ISO
echo "📥 Downloading the UmbrelOS ISO..."
wget -O "/var/lib/vz/template/iso/$ISO_NAME" "$ISO_URL"

# Create the VM in Proxmox
echo "🖥 Creating the VM..."
qm create $VM_ID --name UmbrelOS --memory $RAM --cores $CORES --net0 virtio,bridge=$NET_BRIDGE --ostype l26

# Add the UmbrelOS ISO as a CD drive in the VM
echo "💿 Inserting the UmbrelOS CD..."
qm set $VM_ID --cdrom $STORAGE:iso/$ISO_NAME

# Create the VM disk
echo "💾 Creating a disk of $DISK_SIZE..."
qm set $VM_ID --scsihw virtio-scsi-pci --scsi0 $STORAGE:$DISK_SIZE

# Create the VM disk
echo "💾 Creating a disk of $DISK_SIZE..."
qm set $VM_ID --scsihw virtio-scsi-pci --scsi0 $STORAGE:$DISK_SIZE

# Start the VM
echo "🔄 Starting the VM..."
echo "🎉 And remember! Technology doesn't bite... but sometimes it makes you wonder if it's pulling your leg 😂"
qm start $VM_ID

echo "✅ Installation completed. You can now access the VM and start the UmbrelOS installation."

💡 Tip: If something doesn't work, try turning it off and counting to 3 😆

echo "✅ If you find it useful, don't forget to comment, say thanks, and a thank-you coffee is welcome."