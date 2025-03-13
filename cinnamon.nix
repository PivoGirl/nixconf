{ pkgs, ... }:

{

  # Оточення стола Cinnamon
  services.xserver = {
    enable = true;
		libinput.enable = true;
		displayManager.lightdm.enable = true;
		desktopManager = {
			cinnamon.enable = true;
		};
		displayManager.defaultSession = "cinnamon";
  };

  environment.cinnamon.excludePackages = with pkgs; [
    gnome-terminal
  ];
 
}

