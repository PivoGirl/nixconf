{ pkgs, ...}:

{
  services.mysql = {
    enable = true;
    package = pkgs.mysql84;
  };
}
