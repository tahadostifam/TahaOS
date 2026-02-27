{ config, pkgs, lib, ... }:

let
  root = ./.;
  themesDir = "${root}/themes";
  themeNames =
    builtins.attrNames (builtins.readDir themesDir);
in
{
  home.file = lib.mkMerge [
    (lib.genAttrs themeNames (t: {
      target = ".themes/${t}";
      source = "${themesDir}/${t}";
    }))
  ];

  dconf = {
    enable = true;

    settings."org/gnome/shell" = {
      disable-user-extensions = false;
    };
  };

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "GNOME";
    XDG_SESSION_DESKTOP = "GNOME";
    XDG_SESSION_TYPE = "wayland";
    GTK_THEME = "WhiteSur-Dark";
  };
}
