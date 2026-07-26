{ specialArgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    download-buffer-size = 524288000;
    http-connections = 100;
    max-jobs = "auto";
  };

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS     = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY    = "de_DE.UTF-8";
    LC_NAME        = "de_DE.UTF-8";
    LC_NUMERIC     = "de_DE.UTF-8";
    LC_PAPER       = "de_DE.UTF-8";
    LC_TELEPHONE   = "de_DE.UTF-8";
    LC_TIME        = "de_DE.UTF-8";
  };
  console.keyMap = "us";
  services.xserver.xkb.layout = "us";

  networking.hostName = specialArgs.hostname;
  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  services.printing.enable = false;

  programs.zsh.enable = true;

  networking.firewall.enable = false;

  services.gvfs.enable = true;
}
