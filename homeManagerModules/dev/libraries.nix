{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    devlibs.enable = lib.mkEnableOption "enable devlibs";
  };

  config = lib.mkIf config.devlibs.enable {
    home.packages = with pkgs; [
      nixfmt-rfc-style
      alejandra
      nixd
    ];
  };
}
