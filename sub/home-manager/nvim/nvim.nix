{ pkgs, lib, ... }:

let
  setupDir = ./setup;
  neovimLuaConfig = builtins.readFile ./nvim.lua;
  setupDirContents = builtins.readDir setupDir;

  setupFiles = lib.filter
    (name:
      let
        fileType = setupDirContents.${name};
        isLua = lib.hasSuffix ".lua" name;
      in
      fileType == "regular" && isLua
    )
    (builtins.attrNames setupDirContents);

  sortedSetupFiles = lib.sort (a: b: a < b) setupFiles;

  setupChunks = map (fileName:
    let
      filePath = setupDir + "/${fileName}";
      content = builtins.readFile filePath;
      comment = "------ " + fileName + " ------";
    in
      comment + "\n" + content
  ) sortedSetupFiles;

  concatenatedSetup = lib.concatStringsSep "\n\n" setupChunks;

  finalLuaConfig = neovimLuaConfig + (
    if setupChunks != [] then "\n\n" + concatenatedSetup else ""
  );

in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    initLua = finalLuaConfig;

    plugins = with pkgs.vimPlugins; [
      lualine-nvim
      vim-css-color
      monokai-pro-nvim
      vim-suda
      fzf-lua
      lean-nvim
    ];
  };
}
