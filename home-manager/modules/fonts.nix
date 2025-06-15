{ config, lib, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.input-fonts.acceptLicense = true;
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    liberation_ttf
    fira-code
    fira-code-symbols
    courier-prime
    terminus_font
    cascadia-code
    input-fonts
    oxygenfonts
    freefont_ttf
    intel-one-mono

    # Icons
    font-awesome_5
    noto-fonts
    noto-fonts-emoji
    mplus-outline-fonts.githubRelease

    # Persian fonts
    ir-standard-fonts
    vazir-fonts
    vazir-code-font
    shabnam-fonts

    nerd-fonts.roboto-mono
    nerd-fonts.ubuntu
    nerd-fonts.ubuntu-mono
    nerd-fonts.ubuntu-sans
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    nerd-fonts.hack
  ];

  fonts.fontconfig = {
    defaultFonts = {
      serif = [ "RobotoMono" "Vazirmatn" ];
      sansSerif = [ "Ubuntu" "Vazirmatn" ];
      monospace = [ "Ubuntu Mono" ];
    };
  };
}

