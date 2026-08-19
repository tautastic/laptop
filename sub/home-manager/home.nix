{ config, pkgs, specialArgs, ... }:

{

  home-manager.users.${specialArgs.username} = { config, ... }: {
    home.stateVersion = specialArgs.stateVersion;
    xdg.userDirs.enable = true;
    xdg.userDirs.createDirectories = true;

    programs.home-manager.enable = true;

    programs.git = {
      enable = true;
      settings.user.name = specialArgs.gitUsername;
      settings.user.email = specialArgs.gitUseremail;
      settings.init.defaultBranch = "main";
    };

    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 7d --keep 3";
      flake = "/home/${specialArgs.username}/.config/nixos";
    };

    programs.nix-your-shell = {
      enable = true;
      enableZshIntegration = true;
      # Optional: Whether to pipe the build output through nix-output-monitor. Default: false.
      nix-output-monitor.enable = false;
    };

    imports = [
      ./fonts.nix
      ./gnome-settings.nix
      ./user-packages.nix
      ./keyboard-layout.nix
      ./librewolf.nix
      ./jetbrains.nix
      ./kitty/kitty.nix
      ./vis/vis.nix
      ./yazi/yazi.nix
      ./zathura.nix
      ./zsh/zsh.nix
    ];
  };
}