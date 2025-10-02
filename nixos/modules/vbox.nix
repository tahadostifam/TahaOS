{ user, ... }: {
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.draganddrop = true;
  users.extraGroups.vboxusers.members = [ user ];
}