{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    localsearch
    obs-studio
    vlc
    pavucontrol
    telegram-desktop
    google-chrome
    nekoray
    vscode
    postman
    vim
    
    # CLI utils
    playerctl
    unzip
    zip
    wget

    # Coding stuff
    nodejs
    pnpm
    yarn
    python311
    ruby 
    rustup
    go

    # DB
    sqlite
    postgresql

    # WM stuff
    libnotify
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
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
    docker-compose
    nixpkgs-fmt
    direnv
    ntfs3g
  ];
}
