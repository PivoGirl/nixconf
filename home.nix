{ ... }:

{
  home = {
    username = "pivogirl";
    homeDirectory = "/home/pivogirl";
    stateVersion = "24.05";
    enableNixpkgsReleaseCheck = false;
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  xresources.properties = {
    "Xft.dpi" = "96";
  };

  home.sessionVariables = {
    TERMINAL = "alacritty";
    EDITOR = "vscode";
  };

  imports = [
    ./homeManagerModules
  ];

  helix.enable = true;
  vscode.enable = true;
  devlibs.enable = true;

  hyprland.enable = true;
  obs.enable = true;

}
