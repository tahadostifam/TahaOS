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
    pnpm
    yarn
    python311
    ruby 
    rustup
    go
    gcc
    cmake
    postman

    # WM stuff
    libnotify
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    nwg-bar
    waybar
    swww
    waypaper
    wofi
    hyprlock
    grim
    slurp
    swappy
    jq
    wl-clipboard
    brightnessctl
    pamixer
    fastfetch
    alacritty
    htop
    swaynotificationcenter
    polkit_gnome
    networkmanagerapplet

    # Other
    nix-prefetch-scripts
    nixpkgs-fmt
    direnv
    docker-compose
  ];
}
