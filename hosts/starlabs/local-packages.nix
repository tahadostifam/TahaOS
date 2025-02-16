{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gcc
    gnome-tweaks
  ];
}
