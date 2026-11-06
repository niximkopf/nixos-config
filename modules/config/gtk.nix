{ pkgs, ... }:

{
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
    gtk3.extraCss = ''
      @import "gtk3-dark.css";
      @import "nemo.css";
      @import url("noctalia.css");
    '';
    gtk4.extraCss = ''
      @import url("noctalia.css");
    '';
    gtk4.theme = null;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme.override {
        color = "violet";
      };
    };
  };
}