{
  home.file.".config/waybar/config" = {
    source = ./config.jsonc;
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
