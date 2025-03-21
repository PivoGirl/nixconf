{ ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 300;
        height = 300;
        offset = "30x50";
        origin = "top-right";
        frame_width = 2;
        corner_radius = 10;
        transparency = 10;
        frame_color = "#89b482";
        font = "Mononoki Nerd Font Propo";
      };
      urgency_low = {
        background = "#282828";
        foreground = "#ebdbb2";
        frame = "#458588";
      };

      urgency_normal = {
        background = "#282828";
        foreground = "#ebdbb2";
        frame = "#b16286";
      };

      urgency_critical = {
        background = "#cc241d";
        foreground = "#fbf1c7";
        frame = "#fb4934";
      };

    };
  };
}
