#! /bin/bash
# ===============================================================================================
# Title: Arch Linux Setup Script
# Description: This script is part of the dotfiles and is used to install packages on Arch Linux.
# Author: Mohamed Hussein Al-Adawy.
# Last Modified: 2024-11-06
# ===============================================================================================

source "$HOME/dotfiles/scripts/env_variables.sh"

# --------
kvm_packages=(qemu-full qemu-img swtpm tuned guestfs-tools virt-install virt-manager
  virt-viewer virt-what libvirt vulkan-virtio virtiofsd virtio-win qemu-hw-display-virtio-vga-gl
  qemu-hw-display-virtio-vga qemu-hw-display-virtio-gpu-pci-gl qemu-hw-display-virtio-gpu-pci
  qemu-hw-display-virtio-gpu-gl qemu-hw-display-virtio-gpu edk2-ovmf libosinfo)

# --------
check_hardware_support() {
  echo -e "${Cya}➞ [+] Checking hardware support for KVM on AMD CPUs...${Whi}"
  is_kvm_supported=$(LC_ALL=C.UTF-8 lscpu | grep Virtualization)

  if [[ "$is_kvm_supported" != *"AMD-V"* ]]; then
    echo -e "${Red}➞ [!] KVM is not supported on this system.${Whi}"
    echo -e "${Red}➞ [!] Please enable virtualization in your BIOS/UEFI settings.${Whi}"
    echo -e "${Red}➞ [!] Exiting...${Whi}"
    exit 1
  fi
  echo -e "${Gre}➞ [+] KVM is supported on this system.${Whi}"
  echo -e "$Separator"
  sleep "$sleep_time"
}

# --------
check_if_kernel_has_kvm_module() {
  echo -e "${Cya}➞ [+] Checking if the kernel has the KVM module...${Whi}"
  is_kvm_module_present=$(zgrep CONFIG_KVM /proc/config.gz)

  if [ -z "$is_kvm_module_present" ]; then
    echo -e "${Red}➞ [!] The kernel does not have the KVM module.${Whi}"
    echo -e "${Red}➞ [!] Exiting...${Whi}"
    exit 1
  fi
  echo -e "${Gre}➞ [+] The kernel has the KVM module.${Whi}"
  echo -e "$Separator"
  sleep "$sleep_time"
}

# --------
install_kvm_packages() {
  yay -S --needed --noconfirm "${kvm_packages[@]}"
  echo -e "$Separator"
  sleep "$sleep_time"
}

# --------
enable_kvm_monolithic_service() {
  echo -e "${Cya}➞ [+] Enabling KVM monolithic service...${Whi}"
  sudo systemctl enable libvirtd
  sudo systemctl start libvirtd
  echo -e "${Gre}➞ [+] KVM monolithic service enabled.${Whi}"
}

# --------
enable_kvm_modular_service() {
  echo -e "${Cya}➞ [+] Enabling KVM modular service...${Whi}"
  for drv in qemu interface network nodedev nwfilter secret storage; do
    sudo systemctl enable virt${drv}d.service
    sudo systemctl enable virt${drv}d{,-ro,-admin}.socket
  done
  echo -e "${Gre}➞ [+] KVM modular service enabled.${Whi}"
}

# --------
choose_kvm_service() {
  while true; do
    echo -e "${Cya}➞ [+] Choose the KVM service to enable:${Whi}"
    echo -e "${Cya}➞ [1] Monolithic service${Whi}"
    echo -e "${Cya}➞ [2] Modular service${Whi}"
    echo -e "${Cya}➞ See this documentation for more information: https://libvirt.org/daemons.html#architectural-options ${Whi}"
    read -r choice
    case $choice in
    1)
      enable_kvm_monolithic_service
      break
      ;;
    2)
      enable_kvm_modular_service
      break
      ;;
    *)
      echo -e "${Red}➞ [!] Invalid choice, please try again.${Whi}"
      ;;
    esac
  done
  echo -e "$Separator"
  sleep "$sleep_time"
}

# --------
enable_tuned_service() {
  echo -e "${Cya}➞ [+] Enabling tuned service...${Whi}"
  sudo systemctl enable --now tuned.service
  sudo tuned-adm profile virtual-host
  tuned-adm active
  sudo tuned-adm verify
  echo -e "${Gre}➞ [+] Tuned service configured.${Whi}"
  echo -e "$Separator"
  sleep "$sleep_time"
}

# --------
verify_host_virtualization() {
  echo -e "${Cya}➞ [+] Verifying host virtualization...${Whi}"
  echo -e "${Cya}➞ [+] You should see something like this:${Whi}"
  echo -e "${Cya}➞ QEMU: Checking for hardware virtualization             : PASS${Whi}"
  echo -e "${Cya}➞ QEMU: Checking if device '/dev/kvm' exists             : PASS${Whi}"
  echo -e "${Cya}➞ QEMU: Checking if device '/dev/kvm' is accessible      : PASS${Whi}"
  echo -e "${Cya}➞ QEMU: Checking if device '/dev/vhost-net' exists       : PASS${Whi}"
  echo -e "${Cya}➞ QEMU: Checking if device '/dev/net/tun' exists         : PASS${Whi}"
  echo -e "${Cya}➞ QEMU: Checking for cgroup 'cpu' controller support     : PASS${Whi}"
  echo -e "${Cya}➞ QEMU: Checking for cgroup 'cpuacct' controller support : PASS${Whi}"
  echo -e "${Cya}➞ QEMU: Checking for cgroup 'cpuset' controller support  : PASS${Whi}"
  echo -e "${Cya}➞ QEMU: Checking for cgroup 'memory' controller support  : PASS${Whi}"
  echo -e "${Cya}➞ QEMU: Checking for cgroup 'devices' controller support : PASS${Whi}"
  echo -e "${Cya}➞ QEMU: Checking for cgroup 'blkio' controller support   : PASS${Whi}"
  echo -e "${Cya}➞ QEMU: Checking for device assignment IOMMU support     : PASS${Whi}"
  echo -e "${Cya}➞ QEMU: Checking if IOMMU is enabled by kernel           : PASS${Whi}"
  echo -e "${Cya}➞ QEMU: Checking for secure guest support                : WARN (Unknown if this platform has Secure Guest support)${Whi}"
  echo -e "${Cya}➞ [+] If you see any errors, please check the documentation and try again.${Whi}"
  sudo virt-host-validate qemu
  echo -e "${Gre}➞ [+] Host virtualization verified.${Whi}"
  echo -e "$Separator"
  sleep "$sleep_time"
}

# --------
enable_amd_sev() {
  echo -e "${Cya}➞ [+] Enabling AMD SEV...${Whi}"
  echo "options kvm_amd sev=1" >>/etc/modprobe.d/amd-sev.conf
  echo -e "${Gre}➞ [+] AMD SEV enabled, please reboot the system after the script finishes.${Whi}"
  echo -e "$Separator"
  sleep "$sleep_time"
}

# --------
add_user_to_libvirt_group() {
  echo -e "${Cya}➞ [+] Adding user to libvirt group...${Whi}"
  sudo usermod -aG libvirt "$USER"
  echo -e "${Gre}➞ [+] User added to libvirt group.${Whi}"
  echo -e "$Separator"
  sleep "$sleep_time"
}

# --------
main() {
  check_hardware_support
  check_if_kernel_has_kvm_module
  install_kvm_packages
  choose_kvm_service
  enable_amd_sev
  verify_host_virtualization
  enable_tuned_service
  add_user_to_libvirt_group
  echo -e "${Gre}➞ [+] KVM setup completed, please reboot the system after the script finishes.${Whi}"
  echo -e "$Separator"
  sleep "$sleep_time"
}

main
