{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = "~/nixconf/homeManagerModules/configs/gruvbox-material.rasi";
  };
}
