{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    virtualBox.enable = lib.mkEnableOption "enable Oracle VirtualBox";
  };

  config = lib.mkIf config.virtualBox.enable {
    environment.systemPackages = [ pkgs.virtualbox ];

    virtualisation.virtualbox.host.enable = true;
    virtualisation.virtualbox.host.enableExtensionPack = true;
    users.extraGroups.vboxusers.members = [ "pivogirl" ];
    virtualisation.virtualbox.guest.enable = true;
    virtualisation.virtualbox.guest.dragAndDrop = true;
  };
}
