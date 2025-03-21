{
  config,
  pkgs,
  lib,
  ...
}:

{
  options = {
    nvidia.enable = lib.mkEnableOption "enable nvidia drivers";
  };

  config = lib.mkIf config.nvidia.enable {
    # Драйвера відеокарти
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-compute-runtime
        nvidia-vaapi-driver
      ];
    };

    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {

      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;

    };

    environment.variables = {
      # __GL_GSYNC_ALLOWED = "0";
      # __GL_VRR_ALLOWED = "0";
      # __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      # GBM_BACKEND = "nvidia-drm";
    };
  };
}
