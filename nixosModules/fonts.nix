{
  pkgs,
  lib,
  config,
  ...
}:

{

  options = {
    fonts.enable = lib.mkEnableOption "enable fonts";
  };

  config = lib.mkIf config.fonts.enable {
    fonts.packages =
      with pkgs;
      [
        liberation_ttf
        corefonts
      ]
      ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  };
}
