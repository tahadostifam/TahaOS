{ config, pkgs, ... }: 
let 
  zshSkullTheme = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/tahadostifam/skull-zsh/refs/heads/master/skull.zsh-theme";
    sha256 = "0zx195dhh667121f5z35dniblm29j0wdxm83fxcvwbmmrpv6ba0m";
  };

  customDir = pkgs.stdenv.mkDerivation {
    name = "skull-zsh-custom-dir";
    phases = [ "buildPhase" ];
    buildPhase = ''
      mkdir -p $out/themes
      cp ${zshSkullTheme} $out/themes/skull.zsh-theme
    '';
  };
in {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ 
        "git" 
        "docker" 
        "rust"
        "ruby"
        "golang"
        "node" 
        "npm" 
        "docker-compose"
        "colored-man-pages"
      ];
      custom = "${customDir}";
      theme = "skull";
    };

    shellAliases =
      let
        flakeDir = "~/flake";
      in {
        v = "nvim";
        gs = "git status";
        ga = "git add";
        gc = "git commit";
        gp = "git push";
        ".." = "cd ..";
      };

    history = {
      expireDuplicatesFirst = true;
      path = "${config.xdg.dataHome}/zsh/history";
      size = 100000;
      save = 100000;
    };
  };
}
