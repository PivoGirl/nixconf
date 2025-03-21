{ ... }:

{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        "label" = "logout";
        "action" = "loginctl terminate-user $USER";
        "text" = "Logout";
        "keybind" = "e";
      }
      {
        "label" = "shutdown";
        "action" = "systemctl poweroff";
        "text" = "Shutdown";
        "keybind" = "s";
      }
      {
        "label" = "reboot";
        "action" = "systemctl reboot";
        "text" = "Reboot";
        "keybind" = "r";
      }
    ];
    style = ''
      window {
        background: rgba(0, 0, 0, 0.4);
        
      }

      button {
        background: #32302f;
        border: 2px solid #252423;
        margin: 200px 30px 180px 30px;
      }
      button:focus {
        background: #3c3836;
        border: 2px solid #89b482;
        margin: 200px 30px 180px 30px;
      }

      #logout {
          background-size: 240px;
          background-repeat: no-repeat;
          background-position: center;
          background-image: url("/home/pivogirl/nixconf/homeManagerModules/wlogout/icons/logout.png");
      }

      #shutdown {
          background-size: 250px;
          background-repeat: no-repeat;
          background-position: center;
          background-image: url("/home/pivogirl/nixconf/homeManagerModules/wlogout/icons/shutdown.png");
      }

      #reboot {
          background-size: 240px;
          background-repeat: no-repeat;
          background-position: center;
          background-image: url("/home/pivogirl/nixconf/homeManagerModules/wlogout/icons/reboot.png");

      }
    '';
  };
}
