{ pkgs, ... }:

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
  };
 
  imports = [
	  ./obs.nix
    ./helix.nix
    ./picom.nix
  ];

  qt.enable = true;

  qt.platformTheme.name = "gtk";
  qt.style.name = "Adwaita-dark";

  qt.style.package = pkgs.adwaita-qt;
  
  gtk.enable = true;
  
  gtk.cursorTheme.package = pkgs.yaru-theme;
  gtk.cursorTheme.name = "Yaru";

  # gtk.theme.package = pkgs.gruvbox-material-gtk-theme;
  # gtk.theme.name = "Gruvbox-Material-Dark";

  # gtk.theme.package = pkgs.gruvbox-gtk-theme;
  # gtk.theme.name = "Gruvbox-Dark";

  gtk.theme.package = pkgs.adw-gtk3;
  gtk.theme.name = "adw-gtk3-dark";

  # gtk.iconTheme.package = pkgs.adwaita-icon-theme;
  # gtk.iconTheme.name = "Adwaita";

  gtk.iconTheme.package = pkgs.colloid-icon-theme;
  gtk.iconTheme.name = "Colloid-Dark";
}
