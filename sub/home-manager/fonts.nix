{ pkgs, ... }:

{
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    jetbrains-mono
    nerd-fonts.jetbrains-mono
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "Noto Naskh Arabic" "serif" ];
      sansSerif = [ "Noto Sans Arabic" "sans-serif" ];
      monospace = [ "JetBrainsMono Nerd Font" "monospace" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
