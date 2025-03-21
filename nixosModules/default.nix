{ ... }:
{
  imports = [
    ./nvidia.nix
    ./grub.nix
    ./diskmount.nix

    ./packages.nix
    ./fonts.nix

    ./steam.nix
    ./virtualBox.nix
    ./minecraft-server.nix
    # ./musprod.nix
    ./mysql.nix

    ./hyprland.nix
    ./qtile.nix
  ];
}
