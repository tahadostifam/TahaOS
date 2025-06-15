{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    fd
    bun
    gtk3
    swww
    slurp
    swappy
    wayshot
    dart-sass
    hyprpicker
    pavucontrol
    wf-recorder
    wl-clipboard
    brightnessctl
    networkmanager
    inputs.matugen.packages.${system}.default

    gjs
    glib
    glibc
    gnome.gvfs
    astal.io
    astal.cava
    astal.bluetooth
    astal.hyprland
    astal.astal3
    astal.gjs
    astal.network
    astal.battery
    wrapGAppsHook3
    gobject-introspection
  ];

  programs.ags = {
    enable = true;
    configDir = ../ags;
    extraPackages = with pkgs; [
      accountsservice
    ];
  };
}
