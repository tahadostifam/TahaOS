{
  home.file.".config/waybar/config" = {
    source = ./config.jsonc;
    recursive = true;
  };

  home.file.".config/waybar/distro.png" = {
    source = ./distro.png;
    recursive = true;
  };

  home.file.".config/waybar/style.css" = {
    source = ./style.css;
    recursive = true;
  };

  programs.waybar = {
    enable = true;
  };
}
