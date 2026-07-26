{ config, pkgs, ... }:

let
  bookmarks = import ./bookmarks.nix;
  dirBookmarks = bookmarks.dirBookmarks or { };
  fileBookmarks = bookmarks.fileBookmarks or { };

  dirAliases = builtins.mapAttrs (name: value: "cd ${value} && ls") dirBookmarks;
  fileAliases = builtins.mapAttrs (name: value: "$EDITOR ${value}") fileBookmarks;
  namedDirs = builtins.concatStringsSep "\n"
    (builtins.map (name: "hash -d ${name}=${dirBookmarks.${name}}")
      (builtins.attrNames dirBookmarks));

  oldInitContent = ''
    if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
      source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
    fi
    # Colors
    autoload -U colors && colors

    # Disable ctrl-s freeze
    stty stop undef

    setopt interactive_comments

    # Ctrl-f: cd into fzf-selected directory
    bindkey -s '^f' '^ucd "$(dirname "$(fzf)")"\n'

    export PATH="$PATH:$HOME/.local/bin:$HOME/.elan/bin:$GOPATH/bin"

    tmp() {
      local dir
      dir=$(mktemp -d) || return 1
      cd "$dir" || return 1
      if [ $# -ge 1 ]; then
          nvim "$1"
      fi
    }

    [[ -f "$HOME/.config/zsh/.p10k.zsh" ]] && source "$HOME/.config/zsh/.p10k.zsh"

    [[ ! -r '/home/tau/.opam/opam-init/init.zsh' ]] || source '/home/tau/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
  '';

in {
  home.file."${config.home.homeDirectory}/.config/zsh/.p10k.zsh".source = ./p10k.zsh;

  programs.zsh = {
    enable = true;
    dotDir = "${config.home.homeDirectory}/.config/zsh";
    syntaxHighlighting.enable = true;
    autocd = true;
    history = {
      size = 1000;
      save = 1000;
      path = "${config.xdg.cacheHome}/zsh/history";
      ignoreDups = false;
    };
    sessionVariables = {
      EDITOR          = "nvim";
      BROWSER         = "librewolf";
      XDG_CACHE_HOME  = "$HOME/.cache";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_DATA_HOME   = "$HOME/.local/share";
      LOCAL_BIN       = "$HOME/.local/bin";
      GOPATH          = "$HOME/.local/go";
    };
    initContent = oldInitContent + "\n\n# Named directories\n" + namedDirs;
    zplug = {
      enable = true;
      plugins = [
        { name = "jeffreytse/zsh-vi-mode"; }
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
      ];
    };
    shellAliases = {
      g = "git";
      v = "$EDITOR";
      yz = "yazi";
      cp = "cp -iv";
      mv = "mv -iv";
      rm = "rm -vI";
      mkd = "mkdir -pv";
      ip = "ip -color=auto";
      ffmpeg = "ffmpeg -hide_banner";
      grep = "grep --color=auto";
      diff = "diff --color=auto";
      ls = "eza -lAh --color=auto --git --header --group --group-directories-first";
      nix-make = "nh os switch --install-bootloader ~/.config/nixos";
      cpr = "rsync -HAXhaxvPS --numeric-ids --stats";
    } // dirAliases // fileAliases;
  };
}
