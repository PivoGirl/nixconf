{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    qtile.enable = lib.mkEnableOption "enable qtile";
  };

  config = lib.mkIf config.qtile.enable {
    # qtile
    environment.systemPackages = with pkgs; [
      xkb-switch
      dconf
      zoxide
      xclip
      flameshot

    ];
    services = {
      displayManager.ly.enable = true;
      libinput.mouse.accelProfile = "flat";
      xserver = {
        enable = true;
        windowManager.qtile = {
          enable = true;
          configFile = ./qtile/config.py;
          extraPackages =
            python3Packages: with python3Packages; [
              qtile-extras
            ];
        };
      };
    };
  };
}
