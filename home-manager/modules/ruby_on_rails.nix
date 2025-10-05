{ pkgs, ... }: {
  home.packages = with pkgs; [
    ruby_3_4
    rubyPackages_3_4.rails
  ]
}