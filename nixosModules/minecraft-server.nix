{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    mcserver.enable = lib.mkEnableOption "enable minecraft server";
  };

  # майнкрафт сервер, порт 25565, /var/lib/minecraft
  config = lib.mkIf config.mcserver.enable {

    networking.firewall.allowedTCPPorts = [ 25565 ];

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
  };
}
