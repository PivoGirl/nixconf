{ config, pkgs, ... }:

{
  # майнкрафт сервер, порт 25565, /var/lib/minecraft

  environment.systemPackages = with pkgs; [
    mcrcon
   ];

  services.minecraft-server = {
    enable = true;
    eula = true;
    declarative = true;

    package = pkgs.minecraftServers.vanilla-1-18;

    serverProperties = {
      max-player = 10;
      online-mode = false;
      # hardcore = true;
      enable-rcon = true;
      "rcon.password" = "flygirld";
    };
  };
}
