{
  services = {
    xserver.desktopManager.plasma6.enable = true;
    xserver.displayManager.sddm.enable = true;
    xserver.displayManager.sddm.wayland.enable = true;

    xrdp = {
      defaultWindowManager = "startplasma-x11";
      enable = true;
      openFirewall = true;
    };

    xserver = {
      enable = true;

      xkb = {
        layout = "us";
        variant = "";
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  security.rtkit.enable = true;

  environment.systemPackages = with pkgs;
    [
      # KDE
      kdePackages.kcalc             # Calculator
      kdePackages.kcharselect       # Tool to select and copy special characters from all installed fonts
      kdePackages.kclock            # Clock app
      kdePackages.kolourpaint       # Easy-to-use paint program
      kdePackages.ksystemlog        # KDE SystemLog Application
      kdePackages.sddm-kcm          # Configuration module for SDDM
      kdePackages.isoimagewriter    # Program to write hybrid ISO files onto USB disks
      kdePackages.partitionmanager  # Manage the disk devices, partitions and file systems on your computer
    ];
}
