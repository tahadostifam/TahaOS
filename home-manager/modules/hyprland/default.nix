{
  imports = [
    ./scripts
    ./startup.nix
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

  wayland.windowManager.hyprland.settings = {
    "monitor" = ",preferred,auto,1";
    "$mod" = "SUPER";

    exec-once = [
      "waybar -c ~/.config/waybar/config -s ~/.config/waybar/style.css &"
      "polkit-gnome-authentication-agent-1 &"
      "gnome-keyring-daemon --replace --daemonize --components=pkcs11,secrets,ssh &"
      "~/.hyprscripts/wall.sh ~/hyprwall.jpg"
      "swaync &"
    ];

    input = {
      kb_layout = "us,ir";
      kb_options = "grp:alt_shift_toggle";
      kb_variant = "ffffff";
      kb_model = "";
      kb_rules = "";

      follow_mouse = 1;

      touchpad = {
        natural_scroll = "no";
      };
    };

    general = {
      gaps_in = 8;
      gaps_out = 15;
      border_size = 3;
      col.active_border = "rgba(00b418f1) rgba(2bff48f1) 10deg";
      col.inactive_border = "0xff45475a";
      allow_tearing = true;
    };

    decoration = {
      rounding = 10;
      shadow = {
        enabled = true;
        range = 2;
      };
      blur = {
        enabled = true;
        size = 4;
        passes = 2;
        new_optimizations = "yes";
        ignore_opacity = true;
      };
    };

    windowrule = "'float,^(alacritty)$'";

    animations = {
      enabled = 1;
      bezier = "overshot,0.13,0.99,0.29,1.1";
      animations_list = [
        { type = "windows"; duration = 1; speed = 4; curve = "overshot"; style = "slide"; }
        { type = "border"; duration = 1; speed = 10; curve = "default"; }
        { type = "fade"; duration = 1; speed = 10; curve = "default"; }
        { type = "workspaces"; duration = 1; speed = 6; curve = "overshot"; style = "slidefade 40%"; }
      ];
      first_launch_animation = false;
    };

    dwindle = {
      pseudotile = 1; # enable pseudotiling on dwindle
      force_split = 0;
    };

    gestures = {
      workspace_swipe = "yes";
      workspace_swipe_fingers = 4;
    };

    bind =
      [
        "$mod,mouse:272,movewindow"
        "$mod,mouse:273,resizewindow"
        "$mod,RETURN,alacritty"
        "$mod,Q,killactive,"
        "$mod,M,exec,nwg-bar"
        "$mod,E,exec, nautilus"
        "$mod,S,togglefloating,"
        "$mod,R,exec,wofi --show drun"
        "$mod,L, exec, hyprlock"
        "$mod,F, fullscreen"
        "$mod,left,movefocus,l"
        "$mod,right,movefocus,r"
        "$mod,up,movefocus,u"
        "$mod,down,movefocus,d"
        ",Print,exec, ~/.hyprscripts/screenshot_full.sh"
        "$mod, Print, exec, ~/.hyprscripts/screenshot.sh"

        ", XF86AudioRaiseVolume, exec, ~/.hyprscripts/volume.sh --inc"
        ", XF86AudioLowerVolume, exec, ~/.hyprscripts/volume.sh --dec"
        ", XF86AudioMicMute, exec, ~/.hyprscripts/volume.sh --toggle-mic"
        ", XF86AudioMute, exec, ~/.hyprscripts/volume.sh --toggle-mic"
        ", XF86MonBrightnessUp, exec, ~/.hyprscripts/backlight.sh --inc"
        ", XF86MonBrightnessDown, exec, ~/.hyprscripts/backlight.sh --dec"
      ];

    wayland.windowManager.hyprland.systemd.variables = [ "--all" ];
  };
}
