#!/bin/bash

# This script is used to bind and unbind the GPU and its audio device to and from the vfio-pci driver.

# The GPU and its audio device are identified by their PCI addresses.
gpu="0000:01:00.0"
aud="0000:01:00.1"

# The vendor and device IDs of the GPU and its audio device are read from the sysfs.
gpu_vd="$(cat /sys/bus/pci/devices/$gpu/vendor) $(cat /sys/bus/pci/devices/$gpu/device)"
aud_vd="$(cat /sys/bus/pci/devices/$aud/vendor) $(cat /sys/bus/pci/devices/$aud/device)"

# The GPU and its audio device are bound to the vfio-pci driver.
function bind_vfio {
    echo "$gpu" >"/sys/bus/pci/devices/$gpu/driver/unbind"
    echo "$aud" >"/sys/bus/pci/devices/$aud/driver/unbind"
    echo "$gpu_vd" >/sys/bus/pci/drivers/vfio-pci/new_id
    echo "$aud_vd" >/sys/bus/pci/drivers/vfio-pci/new_id
}

# The GPU and its audio device are unbound from the vfio-pci driver.
function unbind_vfio {
    echo "$gpu_vd" >"/sys/bus/pci/drivers/vfio-pci/remove_id"
    echo "$aud_vd" >"/sys/bus/pci/drivers/vfio-pci/remove_id"
    echo 1 >"/sys/bus/pci/devices/$gpu/remove"
    echo 1 >"/sys/bus/pci/devices/$aud/remove"
    echo 1 >"/sys/bus/pci/rescan"
}

# uncomment the function you want to use and run the script.

# Bind the GPU and its audio device to the vfio-pci driver.
# bind_vfio

# Unbind the GPU and its audio device from the vfio-pci driver.
# unbind_vfio
