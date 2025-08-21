{pkgs, ...}: let
  #myOverlays = [ (import ../nixos/overlays/ollama.nix) ];
  #pkgsWithOverlay = import pkgs.path {
  #inherit (pkgs) system;
  #overlays = myOverlays;
  #};
in {
  programs.ssh = {enable = true;};
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

  home.packages = with pkgs;
    [
      cacert # SSL certificates bundle
      jq # JSON processor
      wget # Command-line file downloader
      tldr # Simplified man pages
      awscli2 # AWS CLI version 2
      fx # Command-line JSON processor
      nodejs # JavaScript runtime environment
      ripgrep # Fast search for files
      gh # GitHub CLI tool
      inetutils # Network utilities collection
      bat # Cat command with syntax highlighting
      fd # Fast and user-friendly find
      htop # Interactive process viewer
      ffmpeg # Multimedia processing tool
      libheif # HEIF image format support
      imagemagick # Image manipulation tool
      pgcli # Command-line PostgreSQL client
      litecli # Command-line SQLite client
      dive # Docker image explorer
      damon # Monitoring disk usage
      sshpass # Non-interactive SSH password provider
      unzip # ZIP file extractor
      eza # Modern replacement for ls
      ranger # Console-based file manager
      nnn # Minimalist file browser
      grobi # Automatic window tiling tool
      #steam-run
      scons # Software construction tool
      pkg-config # Manage compile/link flags
      gcc # GNU C Compiler
      cmake # Build system generator
      udev # Hardware device manager
      xorg.libX11 # X11 client-side library
      fontconfig # Font configuration library
      psmisc # Miscellaneous process utilities
      vlc # Multimedia player
      python312Packages.twisted # Event-driven networking engine
      python312Packages.pdfminer-six # PDF parser and analyzer
      jstest-gtk # Joystick testing tool
      ntfs3g # NTFS filesystem driver
      exfatprogs # ExFAT filesystem utilities
      lsof # List open files
      llama-cpp # C++ library for LLaMA models
      qpdf # PDF transformation tool
      ripmime # Extract MIME mail attachments
      postman # API development environment
      chromium # Open-source web browser
      uv # Asynchronous I/O library
      gdu # Disk usage analyzer
      mupdf # Lightweight PDF viewer
      terraform # Infrastructure as code tool
      warp-terminal # Modern terminal with AI features
      pinentry # PIN or passphrase entry tool
      dua # Disk usage analyzer
      dtrx # Extract compressed archives easily
      nix-search-cli # Command-line tool for searching Nix packages
      vscode # Visual Studio Code editor
      dtrx # Extract compressed archives easily
      nixos-generators # NixOS image generators
      tor
      gnumake
      wl-clipboard
    ]
    ++ [(import ./python-packages.nix {pkgs = pkgs;})];
  #++ [ pkgsWithOverlay.ollama ];
}
