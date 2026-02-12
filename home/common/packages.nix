{pkgs, ...}: let
  #myOverlays = [ (import ../nixos/overlays/ollama.nix) ];
  #pkgsWithOverlay = import pkgs.path {
  #inherit (pkgs) system;
  #overlays = myOverlays;
  #};
in {
  programs.ssh = {
    enableDefaultConfig = false;
    enable = true;
  };
  programs.autojump.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  #programs.java.enable = true;
  #programs.java.package = pkgs.jdk19;

  home.sessionVariables = {
    SSL_CERT_FILE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
  };

  home.packages = with pkgs; [
    # =======================
    # GUI Applications
    # =======================
    python315
    vlc # Multimedia player
    chromium # Open-source web browser
    #vscode # Visual Studio Code editor
    jstest-gtk # Joystick testing tool for gamepads
    mupdf # Lightweight PDF viewer
    nautilus # GNOME file manager
    localsend # Local file sharing app
    firefox # Web browser
    gimp # Image editor
    libreoffice # Office suite
    tor-browser # Secure browser with Tor network
    transmission_4-gtk # BitTorrent client
    localsend # Local file sharing app
    kdePackages.kdenlive

    # =======================
    # CLI Tools
    # =======================
    cacert # SSL certificates bundle
    jq # JSON processor
    wget # Command-line file downloader
    tldr # Simplified man pages
    fx # Command-line JSON processor
    nodejs # JavaScript runtime environment & CLI
    pnpm # Fast, disk space efficient package manager for Node.js
    ripgrep # Fast text searcher (rg)
    gh # GitHub CLI tool
    inetutils # Common network utilities (ping, ifconfig, etc)
    bat # Cat command with syntax highlighting
    fd # Fast and user-friendly find alternative
    htop # Interactive process viewer (top alternative)
    ffmpeg # Command-line multimedia processing tool
    libheif # HEIF image format support
    imagemagick # Image manipulation CLI tool
    loupe
    litecli # Command-line SQLite client
    unzip # ZIP file extractor
    eza # Modern replacement for ls
    lsof # List open files
    qpdf # PDF transformation and inspection tool
    ripmime # Extract MIME mail attachments
    uv # Asynchronous I/O library & CLI
    gdu # Disk usage analyzer
    dua # Disk usage analyzer (interactive CLI)
    dtrx # Extract archives easily ("Do The Right Extraction")
    pinentry-gnome3 # Secure PIN or passphrase entry (required by GPG)
    nix-search-cli # Command-line tool for searching Nix packages
    tor # Anonymity network client
    wl-clipboard # Clipboard utilities for Wayland
    bottom # Modern alternative to top/htop
    ntfs3g # NTFS filesystem driver (mount NTFS partitions)
    exfatprogs # ExFAT filesystem utilities (format/mount ExFAT)
    psmisc # Miscellaneous process utilities (killall, fuser, etc)
    udev # Hardware device manager
    fontconfig # Font configuration library & CLI tools
    popsicle # iso image burner for USB sticks
    udisks2
    arp-scan
    pciutils
    starship # Prompt theming for terminal
    usbutils # USB device utilities
    libva-utils
    net-tools

    # =======================
    # Build/Development Tools
    # =======================
    scons # Software construction tool (build system)
    pkg-config # Manage compile/link flags for libraries
    gcc # GNU Compiler Collection (C/C++ compiler)
    cmake # Build system generator
    gnumake # GNU Make build automation tool
    llama-cpp # C++ library and tools for LLaMA models
    #terraform # Infrastructure as code tool (DevOps)
    nixos-generators # Generate NixOS images (ISO, VM, cloud)
    pnpm
    mongosh
    #rustup
    rustc
    cargo
    rust-analyzer
    lld
    packet
    gvfs
    android-file-transfer
    jmtpfs
    kdePackages.dolphin
    exiftool
    libexif
    watchman
    pgcli
    nix-index
    webdav
    dufs
    bun
  ];
}
