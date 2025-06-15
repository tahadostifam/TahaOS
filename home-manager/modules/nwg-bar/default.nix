{
  home.file = {
    ".config/nwg-bar/bar.json" = {
        source = ./bar.json;
        recursive = true;
    };

    ".config/nwg-bar/style.css" = {
        source = ./style.css;
        recursive = true;
    };

    programs.nwg-bar = {
      enable = trued;
    }
  }; 
}
