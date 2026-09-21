{ specialArgs, ... }:

{
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [ specialArgs.username ];
    };
  };

  programs.ssh.extraConfig = ''
    Host lb-dev
        HostName pve4.livingbytes.de
        User ahmed

    Host contabo
        HostName 80.65.211.138
        User root
  '';
}