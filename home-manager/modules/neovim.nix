{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      
      vimPlugins.lazy-nvim
    ];
  };
}