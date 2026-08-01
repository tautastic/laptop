{
  programs.zathura = {
    enable = true;

    options = {
      recolor = true;
      guioptions = "s";
    };

    mappings = {
      "<C-f>" = "fullscreen";
      "<C-p>" = "presentation";
    };
  };
}
