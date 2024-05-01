{
  # Change runtime directory size
 # services.logind.extraConfig = "RuntimeDirectorySize=8G";
#might remove 
#  environment.sessionVariables.NIXOS_OZONE_WL = "1";
#  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";


#screen thing 
#  services.geoclue2.appConfig = {
#      "gammastep" = {
#        isAllowed = true;
#        isSystem = false;
#        users = [ "1000" ]; # (it is 1000 for me) set your user id (to get user id use command 'id -u "your_user_name"')
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
}
