{ pkgs, ... }:

let
  backgroundImage = ../../assets/wallpaper/street.png;
  backgroundName = "street.png";

  customBackgroundSrc = pkgs.fetchFromGitHub {
    owner = "AnKing-VIP";
    repo = "Custom-background-image-and-gear-icon";
    rev = "9706a8f53be26951c057983fb44ea9c89f9208a6";
    hash = "sha256-v9/WR+3DK9+byudHFAtsCsPW3WmRVY003+ufEqIFIxM=";
  };

  customBackground =
    (pkgs.anki-utils.buildAnkiAddon {
      pname = "custom-background";
      version = "4.6";
      src = customBackgroundSrc;
      sourceRoot = "source/addon";
    }).withConfig {
      config = {
        "Image name for background" = backgroundName;
        "Image name for gear" = "gears.svg";
        "background-size" = "cover";
        "background opacity main" = "0.6";
        "background opacity review" = "0.4";
        "Reviewer image" = true;
        "Toolbar image" = true;
      };

      userFiles = pkgs.runCommand "custom-background-user-files" { } ''
        mkdir -p $out/background $out/gear
        cp ${backgroundImage} $out/background/${backgroundName}
        cp ${customBackgroundSrc}/addon/user_files/default_gear/gears.svg $out/gear/gears.svg
      '';
    };
in

{
environment.systemPackages = [
  (pkgs.anki.withAddons [
    pkgs.ankiAddons.anki-connect
    pkgs.ankiAddons.review-heatmap
    customBackground
    (pkgs.ankiAddons.recolor.withConfig {
      config = {
        version = { major = 3; minor = 1; };
        colors = {
          ACCENT_CARD = [ "Card mode" "#b58fff" "#b58fff" "--accent-card" ];
          ACCENT_DANGER = [ "Danger" "#ff6f9b" "#ff6f9b" "--accent-danger" ];
          ACCENT_NOTE = [ "Note mode" "#a8e6cf" "#a8e6cf" "--accent-note" ];
          BORDER = [ "Border" "#4c3a70" "#4c3a70" "--border" ];
          BORDER_FOCUS = [ "Border (focused input)" "#b58fff" "#b58fff" "--border-focus" ];
          BORDER_STRONG = [ "Border (strong)" "#6a52a0" "#6a52a0" "--border-strong" ];
          BORDER_SUBTLE = [ "Border (subtle)" "#1e1630" "#1e1630" "--border-subtle" ];
          BUTTON_BG = [ "Button background" "#110d1a" "#110d1a" "--button-bg" ];
          BUTTON_DISABLED = [ "Button background (disabled)" "#110d1a" "#110d1a" "--button-disabled" ];
          BUTTON_HOVER = [ "Button background (hover)" "#1c1530" "#1c1530" [ "--button-gradient-start" "--button-gradient-end" ] ];
          BUTTON_HOVER_BORDER = [ "Button border (hover)" "#6a52a0" "#6a52a0" "--button-hover-border" ];
          BUTTON_PRIMARY_BG = [ "Button Primary Bg" "#b58fff" "#b58fff" "--button-primary-bg" ];
          BUTTON_PRIMARY_DISABLED = [ "Button Primary Disabled" "#c9aeff" "#c9aeff" "--button-primary-disabled" ];
          BUTTON_PRIMARY_GRADIENT_END = [ "Button Primary Gradient End" "#a170ff" "#a170ff" "--button-primary-gradient-end" ];
          BUTTON_PRIMARY_GRADIENT_START = [ "Button Primary Gradient Start" "#b58fff" "#b58fff" "--button-primary-gradient-start" ];
          CANVAS = [ "Background" "#000000" "#000000" [ "--canvas" "--bs-body-bg" ] ];
          CANVAS_CODE = [ "Code editor background" "#0a0710" "#0a0710" "--canvas-code" ];
          CANVAS_ELEVATED = [ "Review" "#0a0710" "#0a0710" "--canvas-elevated" ];
          CANVAS_GLASS = [ "Background (transparent text surface)" "#00000066" "#00000066" "--canvas-glass" ];
          CANVAS_INSET = [ "Background (inset)" "#000000" "#000000" "--canvas-inset" ];
          CANVAS_OVERLAY = [ "Background (menu & tooltip)" "#110d1a" "#110d1a" "--canvas-overlay" ];
          FG = [ "Text" "#e8d8ff" "#e8d8ff" [ "--fg" "--bs-body-color" ] ];
          FG_DISABLED = [ "Text (disabled)" "#7a6a9c" "#7a6a9c" "--fg-disabled" ];
          FG_FAINT = [ "Text (faint)" "#9a86c4" "#9a86c4" "--fg-faint" ];
          FG_LINK = [ "Text (link)" "#d8b4ff" "#d8b4ff" "--fg-link" ];
          FG_SUBTLE = [ "Text (subtle)" "#cbb8f0" "#cbb8f0" "--fg-subtle" ];
          FLAG_1 = [ "Flag 1" "#ff6f9b" "#ff6f9b" "--flag-1" ];
          FLAG_2 = [ "Flag 2" "#ffb086" "#ffb086" "--flag-2" ];
          FLAG_3 = [ "Flag 3" "#a8e6cf" "#a8e6cf" "--flag-3" ];
          FLAG_4 = [ "Flag 4" "#8fb4ff" "#8fb4ff" "--flag-4" ];
          FLAG_5 = [ "Flag 5" "#b58fff" "#b58fff" "--flag-5" ];
          FLAG_6 = [ "Flag 6" "#9fe3ee" "#9fe3ee" "--flag-6" ];
          FLAG_7 = [ "Flag 7" "#e0c1ff" "#e0c1ff" "--flag-7" ];
          HIGHLIGHT_BG = [ "Highlight background" "#4c3a70" "#4c3a70" "--highlight-bg" ];
          HIGHLIGHT_FG = [ "Highlight text" "#e8d8ff" "#e8d8ff" "--highlight-fg" ];
          SCROLLBAR_BG = [ "Scrollbar background" "#000000" "#000000" "--scrollbar-bg" ];
          SCROLLBAR_BG_ACTIVE = [ "Scrollbar background (active)" "#4c3a70" "#4c3a70" "--scrollbar-bg-active" ];
          SCROLLBAR_BG_HOVER = [ "Scrollbar background (hover)" "#110d1a" "#110d1a" "--scrollbar-bg-hover" ];
          SELECTED_BG = [ "Selected Bg" "#4c3a70" "#4c3a70" "--selected-bg" ];
          SELECTED_FG = [ "Selected Fg" "#e8d8ff" "#e8d8ff" "--selected-fg" ];
          SHADOW = [ "Shadow" "#000000" "#000000" "--shadow" ];
          SHADOW_FOCUS = [ "Shadow (focused input)" "#b58fff" "#b58fff" "--shadow-focus" ];
          SHADOW_INSET = [ "Shadow (inset)" "#000000" "#000000" "--shadow-inset" ];
          SHADOW_SUBTLE = [ "Shadow (subtle)" "#000000" "#000000" "--shadow-subtle" ];
          STATE_BURIED = [ "Buried" "#7a6a9c" "#7a6a9c" "--state-buried" ];
          STATE_LEARN = [ "Learn" "#ff6f9b" "#ff6f9b" "--state-learn" ];
          STATE_MARKED = [ "Marked" "#e6d1ff" "#e6d1ff" "--state-marked" ];
          STATE_NEW = [ "New" "#b58fff" "#b58fff" "--state-new" ];
          STATE_REVIEW = [ "Review" "#a8e6cf" "#a8e6cf" "--state-review" ];
          STATE_SUSPENDED = [ "Suspended" "#9a86c4" "#9a86c4" "--state-suspended" ];
        };
      };
    })
  ])
];
}
