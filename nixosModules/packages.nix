{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    packages.enable = lib.mkEnableOption "enable packages";
  };

  config = lib.mkIf config.packages.enable {
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [

      #nixos
      home-manager
      nix-prefetch-git
      nh

      themechanger

      #internet
      vivaldi
      vivaldi-ffmpeg-codecs
      discord
      vesktop
      telegram-desktop

      #multimedia
      qbittorrent
      qview
      obsidian
      mpv
      losslesscut-bin

      #dev
      helix
      waypaper

      #libraries
      ntfs3g
      ffmpeg-full

      #інше
      libnotify
      playerctl
      pulseaudioFull
      alsa-utils
      p7zip
      pavucontrol
      git
      nautilus

      #terminal
      alacritty

      ncdu
      eza
      fastfetch
      cava
      tree
      btop

      # yazi
      yazi
      ueberzugpp
      imagemagick
      jq
      poppler
      fd
      fzf

    ];
  };
}
