{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.desktop;
in
{
  options.desktop = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to enable desktop environment";
    };
    
    environment = mkOption {
      type = types.enum [ "gnome" "hyprland" "none" ];
      default = "none";
      description = "Which desktop environment to use";
    };
  };

  config = mkIf cfg.enable {
    imports = [
      (mkIf (cfg.environment == "gnome") ./gnome)
      (mkIf (cfg.environment == "hyprland") ./hyprland)
    ];
  };
}