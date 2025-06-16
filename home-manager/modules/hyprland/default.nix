{ pkgs, ... }: {
  imports = [
    ./scripts
  ];

  # Load Wallpaper
  home.file."hyprwall.jpg" = {
    source = ./default_wall.jpg;
  };

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    GDK_BACKEND = "wayland,x11";
    CLUTTER_BACKEND = "wayland";
    WLR_RENDERER = "vulkan";
  };

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.xwayland.enable = true;
  wayland.windowManager.hyprland.systemd.variables = [ "--all" ];
  wayland.windowManager.hyprland.settings = {
    "monitor" = ",preferred,auto,1";

    exec-once = [
      "swww-daemon"
      "waybar -c ~/.config/waybar/config -s ~/.config/waybar/style.css"
      "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
      "gnome-keyring-daemon --replace --daemonize --components=pkcs11,secrets,ssh"
      ''
        swww img ~/hyprwall.jpg --transition-type grow --transition-pos "$(hyprctl cursorpos)" --transition-duration 2
      ''
      # "swaync"
      "nm-applet"
    ];

    input = {
      kb_layout = "us";
      kb_options = "grp:alt_shift_toggle";
      follow_mouse = 1;

      touchpad = {
        natural_scroll = "no";
      };
    };

    general = {
      gaps_in = 8;
      gaps_out = 15;
      border_size = 0; # set 2 if you like
      allow_tearing = true;
      extend_border_grab_area = 50;
      "col.active_border" = "rgba(42f00ce6) rgba(42f00ce6) 10deg";
      "col.inactive_border" = "rgba(0f0f0f00)";
    };

    decoration = {
      rounding = 7;
      shadow = {
        enabled = false;
      };
      blur = {
        enabled = true;
        size = 4;
        passes = 2;
        new_optimizations = "yes";
        ignore_opacity = true;
      };
    };

    windowrule = [
      "float, title:(alacritty)(.*)"
    ];

    animations = {
      enabled = true;
      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      animation = [
        "windows,     1, 7,  myBezier"
        "windowsOut,  1, 7,  default, popin 80%"
        "border,      1, 10, default"
        "borderangle, 1, 8,  default"
        "fade,        1, 7,  default"
        "workspaces,  1, 6,  default"
      ];
    };

    dwindle = {
      pseudotile = 1; # enable pseudotiling on dwindle
      force_split = 0;
    };

    gestures = {
      workspace_swipe = "yes";
      workspace_swipe_fingers = 4;
    };

    bindm = [
      "SUPER,mouse:272,movewindow"
      "SUPER,mouse:273,resizewindow"
    ];

    bind =
      [
        "SUPER,RETURN,exec,alacritty"
        "SUPER,Q,killactive,"
        "SUPER,M,exec,nwg-bar ~/.config/nwg-bar/config.json"
        "SUPER,E,exec, nautilus"
        "SUPER,S,togglefloating,"
        "SUPER,R,exec,wofi --show drun"
        "SUPER,L, exec, hyprlock"
        "SUPER,F, fullscreen"
        "SUPER,left,movefocus,l"
        "SUPER,right,movefocus,r"
        "SUPER,up,movefocus,u"
        "SUPER,down,movefocus,d"
        ",Print,exec, ~/.hyprscripts/screenshot_full.sh"
        "SUPER, Print, exec, ~/.hyprscripts/screenshot.sh"

        ", XF86AudioRaiseVolume, exec, ~/.hyprscripts/volume.sh --inc"
        ", XF86AudioLowerVolume, exec, ~/.hyprscripts/volume.sh --dec"
        ", XF86AudioMicMute, exec, ~/.hyprscripts/volume.sh --toggle-mic"
        ", XF86AudioMute, exec, ~/.hyprscripts/volume.sh --toggle"
        ", XF86MonBrightnessUp, exec, ~/.hyprscripts/backlight.sh --inc"
        ", XF86MonBrightnessDown, exec, ~/.hyprscripts/backlight.sh --dec"

        "SUPER,1,workspace,1"
        "SUPER,2,workspace,2"
        "SUPER,3,workspace,3"
        "SUPER,4,workspace,4"
        "SUPER,5,workspace,5"
        "SUPER,6,workspace,6"
        "SUPER,7,workspace,7"
        "SUPER,8,workspace,8"
        "SUPER,9,workspace,9"
        "SUPER,0,workspace,10"

        "SUPERSHIFT,1,movetoworkspace,1"
        "SUPERSHIFT,2,movetoworkspace,2"
        "SUPERSHIFT,3,movetoworkspace,3"
        "SUPERSHIFT,4,movetoworkspace,4"
        "SUPERSHIFT,5,movetoworkspace,5"
        "SUPERSHIFT,6,movetoworkspace,6"
        "SUPERSHIFT,7,movetoworkspace,7"
        "SUPERSHIFT,8,movetoworkspace,8"
        "SUPERSHIFT,9,movetoworkspace,9"
        "SUPERSHIFT,0,movetoworkspace,10"
      ];
  };
}
