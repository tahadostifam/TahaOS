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
      source = builtins.toFile "screenshot_full.sh" ''
        #!/usr/bin/bash
        grim -c -o "$
        (hyprctl - j activeworkspace | jq - r '.monitor') " - | wl-copy 
        notify-send "
        Screenshot
        copied
        to
        clipboard " -a "
        ss "
      '';
    };

    ".hyprscripts/backlight.sh" = {
      source = builtins.toFile "backlight.sh" ''
        #!/usr/bin/env bash

        iDIR="$HOME/.config/mako/icons"

        # Get brightness
        get_backlight() {
        	LIGHT=$(printf "%.0f\n" $(brightnessctl g))
        	echo "${LIGHT}"
        }

        # Get icons
        get_icon() {
        	current="$(get_backlight)"
        	if [[ ("$current" -ge "0") && ("$current" -le "19200") ]]; then
        		icon="$iDIR/brightness-20.png"
        	elif [[ ("$current" -ge "19200") && ("$current" -le "38400") ]]; then
        		icon="$iDIR/brightness-40.png"
        	elif [[ ("$current" -ge "38400") && ("$current" -le "57600") ]]; then
        		icon="$iDIR/brightness-60.png"
        	elif [[ ("$current" -ge "57600") && ("$current" -le "76800") ]]; then
        		icon="$iDIR/brightness-80.png"
        	elif [[ ("$current" -ge "76800") && ("$current" -le "96000") ]]; then
        		icon="$iDIR/brightness-100.png"
        	fi
        }

        # Notify
        notify_user() {
        	notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$icon" "Brightness : $(get_backlight)"
        }

        # Increase brightness
        inc_backlight() {
        	brightnessctl s +5% && get_icon && notify_user
        }

        # Decrease brightness
        dec_backlight() {
        	brightnessctl s 5%- && get_icon && notify_user
        }

        # Execute accordingly
        if [[ "$1" == "--get" ]]; then
        	get_backlight
        elif [[ "$1" == "--inc" ]]; then
        	inc_backlight
        elif [[ "$1" == "--dec" ]]; then
        	dec_backlight
        else
        	get_backlight
        fi
      '';
    };

    ".hyprscripts/volume.sh" = {
      source = builtins.toFile "volume.sh" ''
        #!/usr/bin/env bash

        iDIR="$HOME/.config/mako/icons"

        # Get Volume
        get_volume() {
          volume=$(pamixer --get-volume)
          echo "$volume"
        }

        # Get icons
        get_icon() {
          current=$(get_volume)
          if [[ "$current" -eq "0" ]]; then
            echo "$iDIR/volume-mute.png"
          elif [[ ("$current" -ge "0") && ("$current" -le "30") ]]; then
            echo "$iDIR/volume-low.png"
          elif [[ ("$current" -ge "30") && ("$current" -le "60") ]]; then
            echo "$iDIR/volume-mid.png"
          elif [[ ("$current" -ge "60") && ("$current" -le "100") ]]; then
            echo "$iDIR/volume-high.png"
          fi
        }

        # Notify
        notify_user() {
          notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$(get_icon)" "Volume : $(get_volume) %"
        }

        # Increase Volume
        inc_volume() {
          pamixer -i 5 && notify_user
        }

        # Decrease Volume
        dec_volume() {
          pamixer -d 5 && notify_user
        }

        # Toggle Mute
        toggle_mute() {
          if [ "$(pamixer --get-mute)" == "false" ]; then
            pamixer -m && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$iDIR/volume-mute.png" "Volume Switched OFF"
          elif [ "$(pamixer --get-mute)" == "true" ]; then
            pamixer -u && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$(get_icon)" "Volume Switched ON"
          fi
        }

        # Toggle Mic
        toggle_mic() {
          if [ "$(pamixer --default-source --get-mute)" == "false" ]; then
            pamixer --default-source -m && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$iDIR/microphone-mute.png" "Microphone Switched OFF"
          elif [ "$(pamixer --default-source --get-mute)" == "true" ]; then
            pamixer -u --default-source u && notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$iDIR/microphone.png" "Microphone Switched ON"
          fi
        }
        # Get icons
        get_mic_icon() {
          current=$(pamixer --default-source --get-volume)
          if [[ "$current" -eq "0" ]]; then
            echo "$iDIR/microphone.png"
          elif [[ ("$current" -ge "0") && ("$current" -le "30") ]]; then
            echo "$iDIR/microphone.png"
          elif [[ ("$current" -ge "30") && ("$current" -le "60") ]]; then
            echo "$iDIR/microphone.png"
          elif [[ ("$current" -ge "60") && ("$current" -le "100") ]]; then
            echo "$iDIR/microphone.png"
          fi
        }
        # Notify
        notify_mic_user() {
          notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$(get_mic_icon)" "Mic-Level : $(pamixer --default-source --get-volume) %"
        }

        # Increase MIC Volume
        inc_mic_volume() {
          pamixer --default-source -i 5 && notify_mic_user
        }

        # Decrease MIC Volume
        dec_mic_volume() {
          pamixer --default-source -d 5 && notify_mic_user
        }

        # Execute accordingly
        if [[ "$1" == "--get" ]]; then
          get_volume
        elif [[ "$1" == "--inc" ]]; then
          inc_volume
        elif [[ "$1" == "--dec" ]]; then
          dec_volume
        elif [[ "$1" == "--toggle" ]]; then
          toggle_mute
        elif [[ "$1" == "--toggle-mic" ]]; then
          toggle_mic
        elif [[ "$1" == "--get-icon" ]]; then
          get_icon
        elif [[ "$1" == "--get-mic-icon" ]]; then
          get_mic_icon
        elif [[ "$1" == "--mic-inc" ]]; then
          inc_mic_volume
        elif [[ "$1" == "--mic-dec" ]]; then
          dec_mic_volume
        else
          get_volume
        fi
      '';
    };
  };

  wayland.windowManager.hyprland.settings = {
    "monitor" = ",preferred,auto,1";
    "$mod" = "SUPER";

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

    windowrule = "'float,^(gnome-terminal)$'";

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
        "$mod,RETURN,exec,gnome-terminal"
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
        "$mod,mouse_down,workspace,e+1"
        "$mod,mouse_up,workspace,e-1"
        ",Print,exec, ~/.hyprscripts/screenshot_full.sh"
        "$mod, Print, exec, ~/.hyprscripts/screenshot.sh"

        ", XF86AudioRaiseVolume, exec, ~/.hyprscripts/volume.sh --inc"
        ", XF86AudioLowerVolume, exec, ~/.hyprscripts/volume.sh --dec"
        ", XF86AudioMicMute, exec, ~/.hyprscripts/volume.sh --toggle-mic"
        ", XF86AudioMute, exec, ~/.hyprscripts/volume.sh --toggle-mic"
        ", XF86MonBrightnessUp, exec, ~/.hyprscripts/backlight --inc"
        ", XF86MonBrightnessDown, exec, ~/.hyprscripts/backlight --dec"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists
          (builtins.genList
            (
              i:0
              let
            ws =
          i + 1;
      in [
      "$mod, code:1${toString i}, workspace, ${toString ws}"
      "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
      ]
      )
      9)
      );
  };
}
