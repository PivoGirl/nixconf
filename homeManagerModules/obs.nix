{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    obs.enable = lib.mkEnableOption "enable Obs Studio";
  };

  config = lib.mkIf config.obs.enable {

    programs.obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        obs-pipewire-audio-capture
        droidcam-obs
      ];
    };
  };
}
