{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
    systemd.setPath.enable = true;
  };
  
  security.pam.services.hyprlock = {};
}
