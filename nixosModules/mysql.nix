{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    mysql.enable = lib.mkEnableOption "enable mysql";
  };

  config = lib.mkIf config.mysql.enable {
    services.mysql = {
      enable = true;
      package = pkgs.mysql84;
    };
  };
}
