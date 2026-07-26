{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    acpid               # ACPI daemon (handles power events)
    btrfs-progs         # Btrfs filesystem tools
    cryptsetup          # Disk encryption (LUKS)
    lvm2                # Logical Volume Manager
    e2fsprogs           # ext2/3/4 filesystem tools
    dosfstools          # FAT filesystem tools
    exfatprogs          # exFAT tools
    f2fs-tools          # F2FS tools
    jfsutils            # JFS tools
    xfsprogs            # XFS tools
    ntfs3g              # NTFS driver & utilities
    dmidecode           # Hardware (SMBIOS) info
    dmraid              # Device‑mapper RAID support
    efibootmgr          # UEFI boot entry management
    networkmanager      # CLI tools (nmcli, nmtui) for the system service
    openssh             # SSH client & server (sshd is a system service)
    usbutils            # lsusb etc.
    which               # trivial but often expected system‑wide
    curl wget rsync     # common data transfer tools – good to have for all users
    less                # default pager used by man, help, etc.
  ];
}
