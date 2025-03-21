{ lib, config, ... }:

{
  options = {
    diskmount.enable = lib.mkEnableOption "Mount disks";
  };

  config = lib.mkIf config.diskmount.enable {

    fileSystems."/home/pivogirl/HDD" = {
      device = "/dev/disk/by-uuid/C8E65C07E65BF3E2";
      fsType = "ntfs";
    };

    fileSystems."/home/pivogirl/SDDD" = {
      device = "/dev/disk/by-uuid/01D7B6FDA98E85F0";
      fsType = "ntfs";
    };
  };
}
