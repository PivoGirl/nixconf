{
  pkgs,
  lib,
  config,
  ...
}:

{
  options = {
    vscode.enable = lib.mkEnableOption "enable vscode";
  };

  config = lib.mkIf config.vscode.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscode.fhs;

      profiles.default = {
        extensions = with pkgs.vscode-extensions; [
          jnoortheen.nix-ide

          ecmel.vscode-html-css
          ms-vscode.live-server

          ms-python.python
          ms-python.debugpy
          ms-python.vscode-pylance

          sainnhe.gruvbox-material

          # vscode-utils.extensionsFromVscodeMarketplace [
          #     {
          #       name = "gruvbox-material-icon-theme";
          #       publisher = "jonathanharty";
          #       version = "1.1.5";
          #       sha256 = "01p67g44mgik5lp7wb2acv2rki6xf3if0w48qyfsckwawm91d9gk";
          #     }
          #   ]
        ];

        userSettings = {
          "window.titleBarStyle" = "custom";
          "workbench.colorTheme" = "Gruvbox Material Dark";
          "workbench.iconTheme" = "gruvbox-material-icon-theme";
          "editor.fontFamily" = "'iosevka oblique', 'monospace', monospace";
          "liveServer.settings.donotShowInfoMsg" = true;
          "window.zoomLevel" = 1;

          "nix.serverPath" = "nixd";
          "nix.enableLanguageServer" = true;
          "nixpkgs" = {
            "expr" = "import <nixpkgs> { }";
          };
          "nix.serverSettings" = {
            "formatting" = {
              "command" = [ "alejandra" ];
            };
            "options" = {
              "nixos" = {
                "expr" = "(builtins.getFlake \"/home/pivogirl/nixconf\").nixosConfigurations.nixos.options";
              };
              "home_manager" = {
                "expr" = "(builtins.getFlake \"/home/pivogirl/nixconf\").homeConfigurations.nixos.options";
              };
            };
          };
        };
      };

    };
  };
}
