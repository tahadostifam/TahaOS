{ unstablePkgs, ... }: {
  programs.hyprland = {
    enable = true;
    package = unstablePkgs.hyprland;
    withUWSM = true;
    xwayland.enable = true;
    systemd.setPath.enable = true;
  };

  services.xserver.displayManager.sessionCommands = ''
    export XDG_CURRENT_DESKTOP="Hyprland"
    export XDG_SESSION_DESKTOP="Hyprland"
    export XDG_SESSION_TYPE="wayland"
    export GDK_BACKEND="wayland,x11"
    export CLUTTER_BACKEND="wayland"
    export WLR_RENDERER="vulkan"
  '';

  security.pam.services.hyprlock = { };
}
