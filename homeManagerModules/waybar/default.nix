{ ... }:

{
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./style.css;
    settings = [
      {
        layer = "top";
        position = "top";
        modules-left = [
          "hyprland/workspaces"
          "hyprland/mode"
          "hyprland/scratchpad"
          "custom/media"
        ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "tray"
          "hyprland/language"
          "pulseaudio"
          "clock"
          "custom/power"
        ];
        "hyprland/workspaces" = {
          disable-scroll = false;
          all-outputs = true;
          persistent-workspaces = {
            "*" = [
              1
              2
              3
              4
              5
            ];
          };
          sort-by-number = true;
          format = "{icon}";
          format-icons = {
            urgent = "";
            active = "";
            focused = "";
            default = "";
          };
        };
        "hyprland/window" = {
          icon = true;
          icon-size = 20;
        };
        "hyprland/language" = {
          format-en = "US";
          format-uk = "UA";
        };
        tray = {
          spacing = 10;
        };
        clock = {
          format = "{:%d.%m.%y %I:%M %p}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
        };
        pulseaudio = {
          format = "{volume}% {icon}";
          format-muted = "󰝟";
          format-icons = {
            hands-free = "";
            headset = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "pavucontrol";
        };
        "custom/power" = {
          format = "";
          on-click = "wlogout";
        };
      }
    ];
  };
}
