{ lib, config, ... }:

{

  options = {
    grub.enable = lib.mkEnableOption "enable grub";
  };

  config = lib.mkIf config.grub.enable {
    boot.loader = {
      timeout = 8;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/";
      };
      grub = {
        enable = true;
        efiSupport = true;
        useOSProber = true;
        device = "nodev";
        default = 2;
      };
    };
  };
}
