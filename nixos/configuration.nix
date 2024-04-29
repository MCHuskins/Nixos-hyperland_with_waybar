 # Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs,  ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    #  ./lanzaboote.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # 

  # Change runtime directory size
 # services.logind.extraConfig = "RuntimeDirectorySize=8G";

  # Enable networking
  networking.networkmanager.enable = true;

# Allow unfree packages
  nixpkgs.config.allowUnfree = true;

#nix flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

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
#might remove 
#  environment.sessionVariables.NIXOS_OZONE_WL = "1";
#  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";


#plasma
# services.xserver.displayManager.sddm.enable = true;
# services.xserver.desktopManager.plasma5.enable = true;


systemd.services.foo = {
  script = ''
    echo 76 > /sys/class/power_supply/BAT0/charge_control_end_threshold
  '';
  wantedBy = [ "multi-user.target" ];
};

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

    # Fonts
fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-font-patcher
  ];

#screen thing 
#  services.geoclue2.appConfig = {
#      "gammastep" = {
#        isAllowed = true;
#        isSystem = false;
#        users = [ "1000" ]; # FIXME: set your user id (to get user id use command 'id -u "your_user_name"')
#      };
#  };  
 # programs.light.enable = true;


  # Enable Services see if I can get ride of thing latter 
  #services.geoclue2.enable = true;
  #programs.direnv.enable = true;
  #programs.dconf.enable = true;
  #services.dbus.enable = true;
  #services.dbus.packages = with pkgs; [
  #	xfce.xfconf #or this one
 # 	gnome2.GConf #idk about this one
  #];
  #services.mpd.enable = true;
  #programs.xfconf.enable = true;
  #services.tumbler.enable = true; 



  # Enable Theme
  #environment.variables.GTK_THEME = "Catppuccin-Macchiato-Standard-Teal-Dark";
  #environment.variables.XCURSOR_THEME = "Catppuccin-Macchiato-Teal";
  #environment.variables.XCURSOR_SIZE = "24";
  #environment.variables.HYPRCURSOR_THEME = "Catppuccin-Macchiato-Teal";
  #environment.variables.HYPRCURSOR_SIZE = "24";
  #qt.enable = true;
  #qt.platformTheme = "gtk2";
  #qt.style = "gtk2";
  #console = {
  #  earlySetup = true;
  #  colors = [
  #    "24273a"
  #    "ed8796"
  #    "a6da95"
  #    "eed49f"
  #    "8aadf4"
  #    "f5bde6"
  #    "8bd5ca"
  #    "cad3f5"
  #    "5b6078"
  #    "ed8796"
  #    "a6da95"
  #    "eed49f"
  #    "8aadf4"
  #    "f5bde6"
  #    "8bd5ca"
  #    "a5adcb"
  #  ];
  #};

  # Override packages
  #nixpkgs.config.packageOverrides = pkgs: {
  #  colloid-icon-theme = pkgs.colloid-icon-theme.override { colorVariants = ["teal"]; };
  #  catppuccin-gtk = pkgs.catppuccin-gtk.override {
  #    accents = [ "teal" ]; # You can specify multiple accents here to output multiple themes 
  #    size = "standard";
  #    variant = "macchiato";
  #  };
  #};


  environment.systemPackages = with pkgs; [
     vim
     sbctl 
     niv
     lshw
     kitty
     firefox
     vscode
    #terminal-utils
     zoxide
    #  fzf
    #  tre-command
    #  rsclock
    #  cava
    #  figlet
    # #utils #migt get ride of if I can
    #  mold
    #  gcc13
    #  jdk11
    #  dioxus-cli
    #  surrealdb
    #  surrealdb-migrations
    #  surrealist
    #  #info-fetchers
    #  neofetch
    #  ipfetch
    #  cpufetch
    #  ramfetch
    #  htop
    #  bottom
    #  btop
    #  zfxtop
    #  kmon
    #  #idk about this one
    #  policycoreutils
    #  #screen 
    #  gammastep
    #  brightnessctl
    #  #theme
    #  numix-icon-theme-circle
    #  colloid-icon-theme
    #  catppuccin-gtk
    #  catppuccin-kvantum
    #  catppuccin-cursors.macchiatoTeal
    #  #sucrearlty idk about this one
    #  vulnix       #scan command: vulnix --system
    #  clamav       #scan command: sudo freshclam; clamscan [options] [file/directory/-]
    #  chkrootkit   #scan command: sudo chkrootkit
    # #services 
    #  at-spi2-atk
    #  qt6.qtwayland
    #  psi-notify
    #  poweralertd
    #  playerctl
    #  psmisc
    #  wl-clipboard
    #  cliphist
    #  clipboard-jh
    #  xdg-utils
    #  wtype
    #  wlrctl
    #  waybar
    #  rofi-wayland
    #  avizo
    #  wlogout
    #  #hyperland stuff
    #  pyprland
    #  hyprpicker
    #  hyprcursor
    #  hyprlock
    #  hypridle
    #  hyprpaper
    #  wezterm
    #  starship
    #  mpv
    #  imv
  ];
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lin = {
    isNormalUser = true;
    description = "lin";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [  
    ];
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
		#offload = {
		#	enable = true;
		#	enableOffloadCmd = true;
		#};
		# Make sure to use the correct Bus ID values for your system!
		intelBusId = "PCI:0:2:0";
		nvidiaBusId = "PCI:01:0:0";
	};


}
