{ config, pkgs, ... }:
{
  programs.helix = {
    enable = true;
    settings = {
      editor.line-number = "relative"; 
      theme = "adwaita-dark";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
  };
}
