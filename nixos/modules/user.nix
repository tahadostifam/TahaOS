{ pkgs, user, ... }: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;
    users.${user} = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
      hashedPassword = "$6$ItRbXYtnb2x3WdCc$pGlXbNMatUo36OtnA5Yh3I84aGHY.beIvPXd8SJKk8sZs8sAIU4HnTk/2NYGzvEYE/F6QJq.Pzj9eqG/btmB/0";
    };
  };

  services.getty.autologinUser = user;
}
