{ homeStateVersion, user, ... }: {
  imports = [
    ./modules
    ./home-packages.nix
  ];

  home-manager.users.${user} = {
    enable = true;
    stateVersion = "16.05";

  };

  # home = {
  #   username = user;
  #   homeDirectory = "/home/${user}";
  #   stateVersion = homeStateVersion;
  # };
}
