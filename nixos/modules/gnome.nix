{ pkgs, user, ... }: {
  services.xserver = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.dock-from-dash
    pkgs.gnome-settings-daemon
    pkgs.gnome-control-center
    pkgs.adwaita-icon-theme
    pkgs.gnome-tweaks
  ];

  environment.gnome.excludePackages = (with pkgs; [
    atomix # puzzle game
    epiphany # web browser
    evince # document viewer
    geary # email reader
    gedit # text editor
    gnome-characters
    gnome-photos
    gnome-tour
    hitori # sudoku game
    iagno # go game
    tali # poker game
    totem # video player
  ]);
}
