# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  #nix flakes
   nix.settings.experimental-features = [ "nix-command" "flakes" ];

#might remove 
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

#screen thing 
 services.geoclue2.appConfig = {
     "gammastep" = {
       isAllowed = true;
       isSystem = false;
       users = [ "1000" ]; # (it is 1000 for me) set your user id (to get user id use command 'id -u "your_user_name"')
     };
 };  
 programs.light.enable = true;

  # Enable Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;
  services.blueman.enable = true;


  # Enable Theme
  environment.variables.GTK_THEME = "Catppuccin-Macchiato-Standard-Teal-Dark";
  environment.variables.XCURSOR_THEME = "Catppuccin-Macchiato-Teal";
  environment.variables.XCURSOR_SIZE = "24";
  environment.variables.HYPRCURSOR_THEME = "Catppuccin-Macchiato-Teal";
  environment.variables.HYPRCURSOR_SIZE = "24";
  qt.enable = true;
  qt.platformTheme = "gtk2";
  qt.style = "gtk2";
  console = {
   earlySetup = true;
   colors = [
     "24273a"
     "ed8796"
     "a6da95"
     "eed49f"
     "8aadf4"
     "f5bde6"
     "8bd5ca"
     "cad3f5"
     "5b6078"
     "ed8796"
     "a6da95"
     "eed49f"
     "8aadf4"
     "f5bde6"
     "8bd5ca"
     "a5adcb"
   ];
  };

  # Override packages
  nixpkgs.config.packageOverrides = pkgs: {
   colloid-icon-theme = pkgs.colloid-icon-theme.override { colorVariants = ["teal"]; };
   catppuccin-gtk = pkgs.catppuccin-gtk.override {
     accents = [ "teal" ]; # You can specify multiple accents here to output multiple themes 
     size = "standard";
     variant = "macchiato";
   };
  };




 # Fonts
   fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-font-patcher
  ];

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # hyperland
  programs.hyprland.enable = true;
 programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;


  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;


  systemd.services.foo = {
    script = ''
      echo 76 > /sys/class/power_supply/BAT0/charge_control_end_threshold
    '';
    wantedBy = [ "multi-user.target" ];
};



  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lin = {
    isNormalUser = true;
    description = "lin";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      #  thunderbird
    ];
  };

#waybar stuff
  programs.direnv.enable = true;
  services.upower.enable = true;
  programs.fish.enable = true;
 # Enable Services see if I can get ride of thing latter 
  services.geoclue2.enable = true;
  programs.dconf.enable = true;
  services.dbus.enable = true;
  #services.dbus.packages = with pkgs; [
  #	xfce.xfconf #or this one
 # 	gnome2.GConf #idk about this one
  #];
  services.mpd.enable = true;
  #programs.xfconf.enable = true;
  services.tumbler.enable = true; 




  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, 
  environment.systemPackages = with pkgs; [
     vim
     sbctl #idk
     niv
     lshw 
     kitty
     firefox
     vscode
 #terminal-utils
      zoxide
      starship
      wezterm
      fzf #can seacerh files i htink 
      tre-command
      rsclock
      cava
      figlet
#     hyprlock
      hyprpaper
      waybar
      dunst 
#waybar things
      ripgrep
 #  #info-fetchers
      neofetch
      ipfetch
      cpufetch
      ramfetch
      avizo #sound
          # #utils #migt get ride of if I can
    #  mold
    #  gcc13
    #  jdk11
    #  surrealdb-migrations
    #  surrealist #not satlbe
     #info-fetchers
     neofetch
     ipfetch
     cpufetch
     ramfetch
     htop
     bottom
     btop
     zfxtop
     kmon
    #  #idk about this one
     policycoreutils
     #screen 
     gammastep
     brightnessctl
    #  #theme
     numix-icon-theme-circle
     colloid-icon-theme
     catppuccin-gtk
     catppuccin-kvantum
     catppuccin-cursors.macchiatoTeal
     #sucrearlty idk about this one
     vulnix       #scan command: vulnix --system
     clamav       #scan command: sudo freshclam; clamscan [options] [file/directory/-]
     chkrootkit   #scan command: sudo chkrootkit
    #services 
     at-spi2-atk
     qt6.qtwayland
     psi-notify
     poweralertd
     playerctl
     psmisc
     wl-clipboard
     cliphist
     clipboard-jh
     xdg-utils
     wtype
     wlrctl
     rofi-wayland #do this one
     wlogout
     #hyperland stuff
     pyprland
     hyprpicker
    #  hyprcursor
    #  hyprlock
     #hypridle


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

  system.stateVersion = "23.11"; # Did you read the comment?

}
