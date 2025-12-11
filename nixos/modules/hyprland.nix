{ unstablePkgs, ... }: {
  programs.hyprland = {
    enable = true;
    package = unstablePkgs.hyprland;
    withUWSM = true;
    xwayland.enable = true;
    systemd.setPath.enable = true;

    sessionVariables = {
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      GDK_BACKEND = "wayland,x11";
      CLUTTER_BACKEND = "wayland";
      WLR_RENDERER = "vulkan";
      TERMINAL = "alacritty";
    };
  };

  security.pam.services.hyprlock = { };
}
