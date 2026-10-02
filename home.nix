{ config, pkgs, ... }:

{
  imports = [
    ./modules/config/shell.nix
    ./modules/config/git.nix
    ./modules/config/starship.nix
    ./modules/config/fastfetch
    ./modules/config/kitty.nix
  ];

  home = {
    username      = "micha";
    homeDirectory = "/home/micha";
    stateVersion  = "25.11";

    pointerCursor = {
      enable = true;
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.callPackage ./pkgs/cursor/mornye-wuwa-cursors { };
      name = "mornye-wuwa-cursors";
      size = 36;
    };   
  };

  xdg = {
    configFile = {
    "niri/config.kdl".source = ./modules/config/niri-config.kdl;
    "rmpc/config.ron".source = ./modules/config/rmpc/config.ron;
    "rmpc/theme.ron".source = ./modules/config/rmpc/theme.ron;

    #xdg.configFile."noctalia/conf.toml".source = .assets/noctalia/conf.toml;
    };

    enable = true;
    userDirs = {
  	  enable = true;
	  createDirectories = true;
	  setSessionVariables = true;
    };
  };

  gtk = {
    enable = true;
    gtk3.extraConfig.gtk-decoration-layout = "menu:close";
    gtk4.extraConfig.gtk-decoration-layout = "menu:close";
    theme = {
      name = "catppuccin-mocha-mauve-standard";
      package = pkgs.catppuccin-gtk.override {
        variant = "mocha";
        accents = [ "mauve" ];
        size = "standard";
      };
    };
    gtk4.extraCss = ''
      @import url("noctalia.css");
      @import 'colors.css';
    '';
    gtk4.theme = null;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme.override {
        color = "violet";
      };
    };
  };

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "catppuccin-mocha-mauve-standard";
      icon-theme = "Papirus-Dark";
    };
  };

  services.easyeffects.enable = true;

  programs.home-manager.enable = true;

}
