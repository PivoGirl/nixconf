{
  lib,
  config,
  ...
}:

{
  options = {
    helix.enable = lib.mkEnableOption "enable helix";
  };

  config = lib.mkIf config.helix.enable {
    programs.helix = {

      enable = true;
      settings = {
        editor.line-number = "relative";
        theme = "/home/pivogirl/nixconf/helix themes/gruvbox_material_dark_soft";
        editor.cursor-shape = {
          normal = "block";

          insert = "bar";
          select = "underline";
        };
      };
    };
  };
}
