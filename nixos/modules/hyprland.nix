{ unstablePkgs, ... }: {
  programs.hyprland = {
    enable = true;
    package = unstablePkgs.hyprland;
    withUWSM = true;
    xwayland.enable = true;
    systemd.setPath.enable = true;
  };

  security.pam.services.hyprlock = { };
}
