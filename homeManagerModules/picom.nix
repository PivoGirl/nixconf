{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    picom.enable = lib.mkEnableOption "enable picom";
  };

  config = lib.mkIf config.picom.enable {
    services.picom = {
      enable = true;
      package = pkgs.picom-pijulius;

      fade = true;
      shadow = true;
      shadowOffsets = [
        (-7)
        (-7)
      ];
      backend = "glx";
      vSync = true;
      fadeSteps = [
        0.08
        0.08
      ];
      settings = {
        shadow-radius = 7;

        frame-opacity = 1;

        corner-radius = 10;

        # dithered-present = false;

        detect-rounded-corners = true;
        # detect-client-opacity = true;
        # detect-transient = true;

        use-damage = true;

      };
    };
  };
}
