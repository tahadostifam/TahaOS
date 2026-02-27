{ config, pkgs, stateVersion, hostname, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../shared.nix
  ];

  networking.hostName = "starlabs";
  desktop.environment = "hyprland";

  environment.systemPackages = with pkgs; [ ];
}
