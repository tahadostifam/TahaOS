{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    obs-studio
    pavucontrol
    telegram-desktop
    localsearch
    google-chrome
    nekoray
    vscode
    firefox
    vlc

    # CLI utils
    playerctl
    unzip
    zip
    wget
    vim

    # Coding stuff
    nodejs
    python311
    ruby 
    rustup
    go
    gcc
    cmake

    # WM stuff
    libsForQt5.xwaylandvideobridge
    libnotify
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland

    # Other
    nix-prefetch-scripts
  ];
}
