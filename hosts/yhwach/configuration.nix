{ config, pkgs, stateVersion, hostname, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../shared.nix
  ];

  networking.hostName = "yhwach";
  desktop.environment = "gnome";

  environment.systemPackages = with pkgs; [ ];
}
