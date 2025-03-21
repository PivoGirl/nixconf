{ pkgs, ... }:

{
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      package = pkgs.adwaita-qt;
      name = "Adwaita-dark";
    };
  };

  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.yaru-theme;
      name = "Yaru";
    };
    theme = {
      package = pkgs.gruvbox-gtk-theme;
      name = "Gruvbox-Dark";
    };
    iconTheme = {
      package = pkgs.gruvbox-dark-icons-gtk;
      name = "oomox-gruvbox-dark";

    };
  };
}
