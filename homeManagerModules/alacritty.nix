{ ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      general = {
        import = [
          "~/nixconf/homeManagerModules/configs/gruvbox-material-alacritty.toml"
        ];
      };

    };
  };
}
