{ pkgs, ... }:

{

#   environment.systemPackages = with pkgs; [
#   # nix-prefetch-url https://marketplace.visualstudio.com/_apis/public/gallery/publishers/PUBLISHER/vsextensions/EXTENSION/VAERSION/vspackage
  
#   (vscode-with-extensions.override {
#     vscodeExtensions = with vscode-extensions; [
#       jnoortheen.nix-ide
#       ecmel.vscode-html-css
#       ms-vscode.live-server
#       ms-python.python
#       ms-python.debugpy
#       ms-python.vscode-pylance
#       sainnhe.gruvbox-material
# ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
#       {
#         name = "gruvbox-material-icon-theme";
#         publisher = "jonathanharty";
#         version = "1.1.5";
#         sha256 = "01p67g44mgik5lp7wb2acv2rki6xf3if0w48qyfsckwawm91d9gk";
#       }
#     ];
#   })    
# ];  
}
