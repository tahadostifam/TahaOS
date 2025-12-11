{
  systemd.services.openssh = {
    enable = true;
    permitRootLogin = "no";
    passwordAuthentication = true;
  };

  systemd.services.openssh.forwardX11 = true;
}
