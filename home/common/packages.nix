{
  pkgs,
  localPkgs,
  ...
}: {
  programs.ssh = {
    enableDefaultConfig = false;
    enable = true;
  };
  programs.autojump.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.sessionVariables = {
    SSL_CERT_FILE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
  };

  home.packages = with pkgs; [
    # =======================
    # GUI Applications
    # =======================
    firefox # Web browser
    #brave # Privacy-focused Chromium-based browser
    chromium # Open-source web browser
    tor-browser # Browser routed through the Tor network
    vlc # Multimedia player
    #libreoffice # Office suite
    transmission_4-gtk # BitTorrent client
    nautilus # GNOME file manager
    kdePackages.dolphin # KDE file manager
    loupe # Image viewer
    godot # Game engine with editor
    popsicle # USB stick ISO image burner

    # =======================
    # Shell & Terminal
    # =======================
    starship # Cross-shell prompt theming
    eza # Modern replacement for ls
    bat # cat with syntax highlighting
    fd # Fast, friendly find alternative
    ripgrep # Fast text search (rg)
    tldr # Simplified man pages
    wl-clipboard # Clipboard utilities for Wayland

    # =======================
    # CLI Utilities
    # =======================
    jq # JSON processor
    fx # Interactive JSON viewer
    htop # Interactive process viewer
    btop # Resource monitor (modern htop)
    bottom # System monitor (btm)
    gdu # Disk usage analyzer
    dua # Interactive disk usage analyzer
    psmisc # Process utilities (killall, fuser)
    lsof # List open files
    file # Detect file types
    zip # Create ZIP archives
    unzip # Extract ZIP archives
    unar
    dtrx # Extract archives of many types
    qpdf # PDF transformation and inspection
    ripmime # Extract MIME mail attachments
    inotify-tools # Filesystem event monitoring

    # =======================
    # Network & Web
    # =======================
    wget # Command-line file downloader
    rclone
    gh # GitHub CLI tool
    inetutils # Network utilities (ping, ifconfig, etc)
    net-tools # Legacy network utilities (netstat, route)
    tcpdump # Network packet capture
    bind # DNS tools (dig, nslookup)
    arp-scan # Discover hosts on local network
    openssl # TLS/SSL cryptographic toolkit
    cloudflared # Cloudflare Tunnel client
    nftables # Firewall and packet filtering
    sing-box # Universal proxy platform
    mihomo # Clash-compatible proxy core
    tor # Anonymity network client
    packet # Network packet manipulation tool
    nmap
    iperf3
    iw

    # =======================
    # Multimedia & Image
    # =======================
    ffmpeg # Multimedia processing tool
    imagemagick # Image manipulation CLI
    libheif # HEIF/HEIC image codec
    libjpeg # JPEG library
    libpng # PNG library
    jpeginfo # JPEG file information and integrity
    exiftool # Read/write EXIF metadata
    libexif # EXIF metadata library
    libxml2 # XML processing library

    # =======================
    # Filesystems & Storage
    # =======================
    ntfs3g # NTFS filesystem driver
    exfatprogs # ExFAT filesystem utilities
    udisks2 # Disk management daemon
    udev # Hardware device manager
    gvfs # Virtual filesystem for desktop apps
    android-file-transfer # MTP file transfer for Android
    fontconfig # Font configuration and rendering
    pciutils # PCI device utilities (lspci)
    usbutils # USB device utilities (lsusb)
    libva-utils # VA-API video acceleration tools

    # =======================
    # Databases
    # =======================
    litecli # Command-line SQLite client
    pgcli # Command-line PostgreSQL client
    #mongosh # MongoDB shell
    postgresql # PostgreSQL server and tools
    libpq # PostgreSQL client library
    diesel-cli # ORM CLI for Rust databases

    # =======================
    # Build & Development
    # =======================
    gcc # C/C++ compiler
    pkgsStatic.stdenv.cc # Static C compiler
    gnumake # Build automation tool
    cmake # Build system generator
    ninja # Fast build system
    scons # Python-based build system
    lld # LLVM linker
    pkg-config # Library discovery for builds
    #zig # Programming language and toolchain
    bun # Fast JavaScript runtime and toolkit
    biome # Fast JS/TS formatter and linter
    llama-cpp # Local LLM inference (C/C++)
    #nodejs # JavaScript runtime
    #pnpm # Fast, disk-efficient Node package manager
    #yarn # Alternative Node package manager
    #terraform # Infrastructure as code

    # =======================
    # Security & Keyring
    # =======================
    pinentry-gnome3 # PIN/passphrase entry (required by GPG)
    gnome-keyring # Secret storage and keyring daemon
    libsecret # Secret service API for keyring
    seahorse # GUI for managing GPG and SSH keys

    # =======================
    # Nix Tooling
    # =======================
    cacert # CA certificate bundle
    nix-search-cli # Command-line Nix package search
    nix-index # Index nixpkgs for nix-locate
    nixos-generators # Generate NixOS images (ISO, VM, cloud)
    cachix

    # =======================
    # Virtualization & Containers
    # =======================
    podman # Daemonless container engine
    podman-compose # Docker-compose compatible orchestrator

    # =======================
    # File Serving (WebDAV)
    # =======================
    webdav # Lightweight WebDAV server
    dufs # Simple file server with WebDAV

    # =======================
    # Cloud & DevOps
    # =======================
    awscli2 # AWS command-line interface
    rsync # Fast file synchronization
    mise # Multi-language version manager
    uv # Fast Python package and project manager

    # =======================
    # Unikraft & Specialized
    # =======================
    kraft # Unikraft build and runtime tool
    flintlock # Unikernel microVM lifecycle manager
    firectl # Firecracker CLI
    localPkgs.unikraft-cli # Local Unikraft CLI wrapper
    localPkgs.gogcli # Local Go-based CLI tool
  ];
}
