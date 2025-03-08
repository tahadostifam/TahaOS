{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    obs-studio
    pavucontrol
    telegram-desktop
    google-chrome
    nekoray
    vscode
    vlc

    localsearch

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
    gcc
    cmake
    postman
    diesel-cli
    sqlite

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

    # Vim stuff
    vim
    neovim
    vimPlugins.lazy-nvim

    # Other
    nix-prefetch-scripts
    docker-compose
    nixpkgs-fmt
    direnv
  ];
}
