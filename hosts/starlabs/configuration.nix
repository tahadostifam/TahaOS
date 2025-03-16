{ pkgs, stateVersion, hostname, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/modules
  ];

  environment.systemPackages = [ pkgs.home-manager ];
  networking.hostName = hostname;
  system.stateVersion = stateVersion;
}

