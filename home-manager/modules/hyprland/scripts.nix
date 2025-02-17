{
  home.file = {
    ".hyprscripts/screenshot.sh" = {
      source = builtins.toFile "screenshot.sh" ''
        #!/usr/bin/bash
        grim -c -g "$(slurp)" - | wl-copy
        notify-send "Screenshot copied to clipboard" -a "ss"
      '';
    };

    ".hyprscripts/screenshot_full.sh" = {
      source = builtins.toFile "screenshot_full.sh" "
        #!/usr/bin/bash
        grim -c -o "$
        (hyprctl - j activeworkspace | jq - r '.monitor') " - | wl-copy 
        notify-send "
        Screenshot
        copied
        to
        clipboard " -a "
        ss "
      ";
    };
  };
}
