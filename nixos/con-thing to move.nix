{
#nix flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
# Enable the X11 windowing system.
  services.xserver.enable = true;
#plasma
services.xserver.displayManager.sddm.enable = true;
services.xserver.desktopManager.plasma5.enable = true;
 
# hyperland
  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

systemd.services.foo = {
  script = ''
    echo 76 > /sys/class/power_supply/BAT0/charge_control_end_threshold
  '';
  wantedBy = [ "multi-user.target" ];
};

  environment.systemPackages = with pkgs; [
     vim
     sbctl 
     niv
     lshw
     kitty
     firefox
     vscode
     zoxide
  ];
  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  hardware.nvidia.prime = {
    sync.enable = true;
		# offload = {
			# enable = true;
			# enableOffloadCmd = true;
		# };
		# Make sure to use the correct Bus ID values for your system!
		intelBusId = "PCI:0:2:0";
		nvidiaBusId = "PCI:01:0:0";
	};
}