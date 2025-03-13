
# Основні команди:
# sudo nixos-rebuild switch --flake ./nix/ # Перезбирання системи
#                       або boot, test
# home-manager switch --flake ./nix # Перезбирання home-manager
# sudo nix-collect-garbage -d # Видалити знімки

{ config, pkgs, ... }:

{

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nvidia.nix
      ./packages.nix
      # ./mysql.nix
      # ./musprod.nix
      # ./minecraft-server.nix

      # desktop environment

      # ./cinnamon.nix
      # ./qtile.nix
      ./hyprland.nix
    ];

    # Grub
  boot.loader = {
    timeout = 8;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/";
    };
    grub = {
      enable = true;
      efiSupport = true;
      useOSProber = true;
      device = "nodev";
      default = 2;
    };
  };

  # Віртуальна камера obs
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';
  security.polkit.enable = true;

  # Монтування дисків
  fileSystems."/home/pivogirl/HDD" = {
    device = "/dev/disk/by-uuid/C8E65C07E65BF3E2";
    fsType = "ntfs";
  };

  fileSystems."/home/pivogirl/SDDD" = {
    device = "/dev/disk/by-uuid/01D7B6FDA98E85F0";
    fsType = "ntfs";
  };

  # programs.fish.enable = true;

  # users.defaultUserShell = pkgs.fish;

  # Вмикання флейків
  nix.settings.experimental-features = ["nix-command" "flakes"];

  environment.systemPackages = with pkgs; [ xorg.xauth ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Автоматичне очищення знімків
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  networking.firewall.allowedTCPPorts = [ 25565 ];

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Kyiv";

  # Setting clock to localtime
  time.hardwareClockInLocalTime = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "uk_UA.UTF-8"; #en_US

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "uk_UA.UTF-8";
    LC_IDENTIFICATION = "uk_UA.UTF-8";
    LC_MEASUREMENT = "uk_UA.UTF-8";
    LC_MONETARY = "uk_UA.UTF-8";
    LC_NAME = "uk_UA.UTF-8";
    LC_NUMERIC = "uk_UA.UTF-8";
    LC_PAPER = "uk_UA.UTF-8";
    LC_TELEPHONE = "uk_UA.UTF-8";
    LC_TIME = "uk_UA.UTF-8";
  };

  # Для віртуальної машини VirtualBox:

  # virtualisation.virtualbox.host.enable = true;
  # virtualisation.virtualbox.host.enableExtensionPack = true;
  # users.extraGroups.vboxusers.members = [ "pivogirl" ];
  # virtualisation.virtualbox.guest.enable = true;
  # virtualisation.virtualbox.guest.draganddrop = true;

  # services.flatpak.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pivogirl = {
    isNormalUser = true;
    description = "PivoGirl";
    extraGroups = [ "networkmanager" "wheel" "video" "input" ];
  };

  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true;

  #шрифты
  fonts.packages = with pkgs; [
    liberation_ttf
    corefonts
  ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);


  #стим, игрульки, ну ты понял

  # programs.steam = {
  #   enable = true;
  #   remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  #   dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  #   localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  # };


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
