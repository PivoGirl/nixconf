{ pkgs, ... }:

{

  musnix = {
    enable = true;
    kernel.realtime = true;
    rtirq.enable = true;
  };

  environment.systemPackages = with pkgs; [
    reaper
    vital
  ];
}
