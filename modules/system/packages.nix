{ pkgs, pkgs-stable, ... }:

{
  environment.systemPackages = with pkgs; [
    # ── Tools ──────────────────────────────────────────
    nodejs
    wget
    curl
    unzip
    psmisc
    lshw
    nix-tree
    nvd
    qbittorrent
    xwayland-satellite
    amdgpu_top
    eza
    bat
    ripgrep
    fd
    zoxide
    fzf
    gitui
    btop
    ncdu
    file
    lm_sensors

    # ── Design ───────────────────────────────────────────────
    sddm-astronaut
    bibata-cursors
    fastfetch
    cava
    lavat
    cmatrix
    noctalia
    openrgb
    vial
    (pkgs.callPackage ../../pkgs/momoisay { })
    kitty-themes

    # ── Programming ───────────────────────────────────────────
    python3
    gcc
    gnumake
    quickshell

    # ── Apps ──────────────────────────────────────────────────
    firefox
    (discord.override { withVencord = true; })
    nemo-with-extensions
    win2xcur
    localsend
    prismlauncher
    easyeffects

    # ── Editor ────────────────────────────────────────────────
    saber
    neovim
    libreoffice
    blender
    obs-studio
    vscode

    # ── Media ─────────────────────────────────────────────────
    shortwave
    loupe
    mpv
    yt-dlp
    rmpc
    mpc
  ];
}