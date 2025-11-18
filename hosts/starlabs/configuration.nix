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

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.systemPackages = with pkgs; [
    home-manager
    cudaPackages.cudatoolkit
  ];
}

