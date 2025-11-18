{ user, pkgs, ... }: {
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;
  users.extraGroups.vboxusers.members = [ user ];

  environment.systemPackages = with pkgs; [
    pkgs.qemu
  ];
}
