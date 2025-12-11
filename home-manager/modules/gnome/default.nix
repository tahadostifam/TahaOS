{ config, pkgs, lib, isGnome, ... }:

let
  root = ./.;
  themesDir = "${root}/themes";
  # extensionsDir = "${root}/extensions";
  themeNames =
    builtins.attrNames (builtins.readDir themesDir);
  # extensionNames =
  #   builtins.attrNames (builtins.readDir extensionsDir);
in
{
  # install themes
  home.file = lib.mkMerge [
    (lib.genAttrs themeNames (t: {
      target = ".themes/${t}";
      source = "${themesDir}/${t}";
    }))
    # (lib.genAttrs extensionNames (ext: {
    #   target = ".local/share/gnome-shell/extensions/${ext}";
    #   source = "${extensionsDir}/${ext}";
    # }))
  ];

  dconf = {
    enable = true;

    settings."org/gnome/shell" = {
      disable-user-extensions = false;
    };
  };

  home.sessionVariables = lib.mkIf isGnome {
    XDG_CURRENT_DESKTOP = "GNOME";
    XDG_SESSION_DESKTOP = "GNOME";
    XDG_SESSION_TYPE = "wayland";
  };
}
