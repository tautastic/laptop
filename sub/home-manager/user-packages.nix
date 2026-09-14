{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    ffmpeg                  # Multimedia framework (for video thumbnails)
    p7zip                   # Archive manager (for extraction and preview)
    jq                      # Command-line JSON processor (for JSON preview)
    poppler                 # PDF rendering library (for PDF preview)
    fd                      # Simple, fast alternative to `find`
    fzf                     # Fuzzy finder for command-line navigation
    zoxide                  # Smarter `cd` with directory history
    resvg                   # SVG rendering library (for SVG previews)
    imagemagick             # Image manipulation (for font, HEIC, and JPEG XL previews)
    gnome-disk-utility      # Udisks graphical front-end
    nautilus                # File manager for GNOME
    loupe                   # GNOME's image viewer application written with GTK4 and Rust
    showtime                # GNOME's video player
    anki                    # Flashcards
    localsend               # Open source Airdrop alternative
    eza                     # Modern alternative to unix builtin 'ls' command
    exiftool                # Meta information reader/writer
    picard                  # Music metadata reader/wrtier
    amberol                 # Music Player
    wl-clipboard            # Wayland Clipboard
    zinit                   # Plugin loader for zsh
    gcc
    gnumake
    go
    nodejs_24
    pnpm
    biome
  ];
}