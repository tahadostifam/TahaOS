{ config, pkgs, stateVersion, hostname, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/modules
  ];

  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = [ pkgs.home-manager ];
  networking.hostName = hostname;
  system.stateVersion = stateVersion;

  # Enable OpenGL
  hardware.graphics = { 
    enable = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}

