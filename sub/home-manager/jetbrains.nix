{ config, pkgs, nix-jetbrains-plugins, ... }:

let
  pluginList = [
    "neokai"
    "ru.adelf.idea.dotenv"
    "mobi.hsz.idea.gitignore"
    "String Manipulation"
    "izhangzhihao.rainbow.brackets.lite"
  ];
  goland = pkgs.jetbrains.goland;
  golandWithPlugins = nix-jetbrains-plugins.lib.buildIdeWithPlugins pkgs goland pluginList;
in {
  home.packages = with pkgs; [
    golandWithPlugins
  ];
}
