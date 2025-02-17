{
  systemd.services.dbusHyprlandActivation = {
    description = "DBus environment for HyprLand";
    wantedBy = [ "default.target" ];
    serviceConfig.ExecStart = "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &";
    serviceConfig.Restart = "no";
    Type="oneshot";
  };

  # dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
  # gnome-keyring-daemon --replace --daemonize --components=pkcs11,secrets,ssh &
  # ~/.hyprscripts/wall.sh &
}