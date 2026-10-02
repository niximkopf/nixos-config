{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # ── System Tools ──────────────────────────────────────────
    git
    nodejs
    wget
    curl
    unzip
    psmisc
    pciutils
    usbutils
    lshw
    nix-tree
    nvd
    qbittorrent

    # ── Terminal Tools ─────────────────────────────────
    eza
    bat
    ripgrep
    fd
    dust
    procs
    zoxide
    fzf
    delta
    gitui
    atuin
    zellij
    btop
    opencode
    croc
    bluetui
    wiremix
    ncdu
    lazygit
    file
    yazi

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
    modrinth-app
    localsend
    anki
    gnome-system-monitor

    # ── Editor ────────────────────────────────────────────────
    saber
    neovim
    libreoffice
    krita
    blender
    obs-studio
    vscode

    # ── Media ─────────────────────────────────────────────────
    loupe
    showtime
    mpv
    yt-dlp
    rmpc
    mpc
    (pkgs.callPackage ../../pkgs/aniworld { })
    ];
}