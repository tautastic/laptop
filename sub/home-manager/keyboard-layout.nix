{ lib, ... }:

{
  home.keyboard = {
    enable = true;
    model = "pc105";
    layout = "us,de,ar";
    variant = ",,mac";
    options = [ "grp:win_space_toggle" ];
  };

  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      sources = [
        (lib.hm.gvariant.mkTuple [ "xkb" "us" ])
        (lib.hm.gvariant.mkTuple [ "xkb" "de" ])
        (lib.hm.gvariant.mkTuple [ "xkb" "ara+mac" ])
      ];
      per-window = false;
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Launch Kitty";
      command = "kitty --start-as=maximized";
      binding = "<Super>Return";
    };

    "org/gnome/desktop/wm/keybindings" = {
      activate-window-menu = [ ];
      begin-move = [ ];
      begin-resize = [ ];
      close = [ "<Super>q" ];
      cycle-group = [ ];
      cycle-group-backward = [ ];
      cycle-panels = [ ];
      cycle-panels-backward = [ ];
      cycle-windows = [ ];
      cycle-windows-backward = [ ];
      lower = [ ];
      maximize = [ ];
      minimize = [ ];
      move-to-center = [ ];
      move-to-corner-ne = [ ];
      move-to-corner-nw = [ ];
      move-to-corner-se = [ ];
      move-to-corner-sw = [ ];
      move-to-monitor-down = [ ];
      move-to-monitor-left = [ ];
      move-to-monitor-right = [ ];
      move-to-monitor-up = [ ];
      move-to-side-e = [ ];
      move-to-side-n = [ ];
      move-to-side-s = [ ];
      move-to-side-w = [ ];
      move-to-workspace-1 = [ "<Super><Shift>1" ];
      move-to-workspace-2 = [ "<Super><Shift>2" ];
      move-to-workspace-3 = [ "<Super><Shift>3" ];
      move-to-workspace-4 = [ "<Super><Shift>4" ];
      move-to-workspace-5 = [ ];
      move-to-workspace-6 = [ ];
      move-to-workspace-7 = [ ];
      move-to-workspace-8 = [ ];
      move-to-workspace-9 = [ ];
      move-to-workspace-10 = [ ];
      move-to-workspace-11 = [ ];
      move-to-workspace-12 = [ ];
      move-to-workspace-down = [ ];
      move-to-workspace-left = [ ];
      move-to-workspace-right = [ ];
      move-to-workspace-up = [ ];
      panel-main-menu = [ ];
      panel-run-dialog = [ ];
      raise = [ ];
      raise-or-lower = [ ];
      set-spew-mark = [ ];
      show-desktop = [ ];
      show-osd = [ ];
      switch-applications = [ "<Super>Tab" ];
      switch-applications-backward = [ ];
      switch-group = [ ];
      switch-group-backward = [ ];
      switch-input-source = [ "<Super>space" ];
      switch-input-source-backward = [ ];
      switch-panels = [ ];
      switch-panels-backward = [ ];
      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
      switch-to-workspace-5 = [ ];
      switch-to-workspace-6 = [ ];
      switch-to-workspace-7 = [ ];
      switch-to-workspace-8 = [ ];
      switch-to-workspace-9 = [ ];
      switch-to-workspace-10 = [ ];
      switch-to-workspace-11 = [ ];
      switch-to-workspace-12 = [ ];
      switch-to-workspace-down = [ ];
      switch-to-workspace-left = [ ];
      switch-to-workspace-right = [ ];
      switch-to-workspace-up = [ ];
      switch-windows = [ ];
      switch-windows-backward = [ ];
      toggle-fullscreen = [ ];
      toggle-maximized = [ "<Super>f" ];
      toggle-on-all-workspaces = [ ];
      toggle-shaded = [ ];
      unmaximize = [ ];
    };

    "org/gnome/shell/keybindings" = {
      disable-extension-version-validation = [ ];
      focus-active-notification = [ ];
      open-application-menu = [ ];
      screenshot = [ ];
      screenshot-window = [ ];
      show-screen-recording-controls = [ ];
      show-screenshot-ui = [ ];
      show-world-clock = [ ];
      toggle-application-view = [ ];
      toggle-message-tray = [ ];
      toggle-overview = [ "<Super>" ];
      toggle-quick-settings = [ ];
    };

    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = [ "<Shift><Super>Left" ];
      toggle-tiled-right = [ "<Shift><Super>Right" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      email = [ ];
      help = [ ];
      home = [ "<Super>h" ];
      magnifier = [ ];
      magnifier-zoom-in = [ ];
      magnifier-zoom-out = [ ];
      play = [ ];
      prev = [ ];
      next = [ ];
      rotate-video-lock = [ ];
      screensaver = [ ];
      screenshot-clip = [ ];
      screenshot = [ ];
      screenreader = [ ];
      search = [ ];
      terminal = [ ];
      volume-down = [ ];
      volume-mute = [ ];
      volume-up = [ ];
      window-screenshot-clip = [ ];
      window-screenshot = [ ];
      www = [ "<Super>w" ];
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };
  };
}
