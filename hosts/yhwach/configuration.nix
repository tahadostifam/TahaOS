{ config, pkgs, stateVersion, hostname, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/modules
  ];

  nixpkgs.config.allowUnfree = true;
  programs.nix-ld.enable = true;
  
  networking.hostName = hostname;
  system.stateVersion = stateVersion;

  hardware.graphics = { 
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    home-manager
  ];
}

