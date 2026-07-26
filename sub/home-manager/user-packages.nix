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
    xclip                   # Clipboard interface for X11 (copy/paste from terminal)
    xsel                    # Another clipboard tool for X11
    gnome-disk-utility      # Udisks graphical front-end
    papers                  # GNOME's document viewer
    nautilus                # File manager for GNOME
    loupe                   # GNOME's image viewer application written with GTK4 and Rust
    showtime                # GNOME's video player
    anki                    # Flashcards
    elan                    # Lean version manager
    localsend               # Open source Airdrop alternative
    gcc                     # C++ compiler
    gnumake                 # GNU implementation of make
    cmake                   # C/C++ Build system
    opam                    # OCaml version manager
    eza                     # Modern alternative to unix builtin 'ls' command
    go                      # Go Programming Language
    exiftool                # Meta information reader/writer
    picard                  # Music metadata reader/wrtier
    amberol                 # Music Player
    xdot
  ];
}
