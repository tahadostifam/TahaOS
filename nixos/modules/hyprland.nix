{ unstablePkgs, config, ... }: {
  programs.hyprland = {
    enable = true;
    package = unstablePkgs.hyprland;
    withUWSM = true;
    xwayland.enable = true;
    systemd.setPath.enable = true;
  };

  security.pam.services.hyprlock = { };

  _module.args = {
    isHyprland = config.programs.hyprland.enable;
  };
}
