{ pkgs, ...}:

{

  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = with pkgs; [


  #nixos
  home-manager
  nix-prefetch-git
  
  themechanger
  
  #internet
  vivaldi
  discord
  vesktop
  telegram-desktop

  #multimedia
  qbittorrent
  qview
  krita
  obsidian
  mpv
  losslesscut-bin
  
  #dev
  helix
	zed-editor
  vscode.fhs

  #libraries
  ntfs3g
  ffmpeg-full

  #інше
  # picom-pijulius
  
  # virtualboxKvm
  rofi-wayland
  playerctl
  pulseaudioFull
  alsa-utils
  dunst

  # yazi
  yazi
  ueberzugpp
  imagemagick
  jq
  poppler
  fd
  fzf

  p7zip
  
  pavucontrol
  wlogout
  
  nautilus
  # nemo
  # xfce.thunar
  # xfce.xfconf
  dolphin
  alacritty
  # zoom-us
  fastfetch
  cava
  tree
  git
  btop

];

programs.thunar.plugins = with pkgs.xfce; [
  thunar-archive-plugin
  thunar-volman
];

}
