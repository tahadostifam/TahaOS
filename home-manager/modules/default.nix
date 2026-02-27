{ config, pkgs, inputs, user, homeStateVersion, desktop, ... }:

{
  imports = [
    ./git.nix
    ./fonts.nix
    ./zsh.nix
    ./llvm.nix
    ./ruby_on_rails.nix
  ]
  
  ++ (if desktop == "hyprland" then [
    ./hyprland
    ./wofi
    ./alacritty
    ./swaync
    ./waybar
  ] else [])
  
  ++ (if desktop == "gnome" then [
    ./gnome
  ] else []);

  
  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };
}