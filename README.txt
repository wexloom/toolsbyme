炎 HOMURA v1.0.0

HOMURA is a powerful, self-contained USB flash utility designed for Linux users. It provides a graphical interface (via Python Tkinter) to manage USB drives, verify integrity, and create bootable media across multiple distributions.
✨ Features

    Cross-Distro Support: Optimized for Arch, Ubuntu/Debian, and Fedora/RHEL.

    Automated Dependency Management: Automatically detects and installs required system packages like parted, util-linux, and dosfstools.

    Safety First: Built-in checks to prevent accidental formatting of critical system partitions (like /, /home, or /boot).

    Advanced Partitioning: Supports MBR and GPT labeling, as well as creating persistent storage partitions.

    Integrity Tools: Integrated bad block checking and checksum verification (MD5, SHA-1, SHA-256).

    Multiple Filesystems: Support for FAT32, NTFS, exFAT, and ext4.

🚀 Getting Started
Prerequisites

The script requires a graphical environment (X11 or Wayland) and sudo privileges to manage block devices.
Installation

You can run HOMURA directly using the self-contained launcher:
Bash

# Download the script
# Make it executable
chmod +x /path/to/your/file/homura.sh

# Run it (do NOT use sudo; the script will ask for it when needed)
./homura.sh

🛠️ Requirements

The utility automatically handles the following dependencies:

    Python 3.8+ (with tkinter)

    System Tools: lsblk, parted, dd, sync, blockdev

    Filesystem Tools: dosfstools, ntfs-3g, exfatprogs, e2fsprogs

📜 License

MIT License - Copyright (c) 2025 Wexloom Project.
