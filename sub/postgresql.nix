{ pkgs, ... }:

{
  services.postgresql = {
    enable = true;
    settings = {
      listen_addresses = "localhost";
    };
    authentication = pkgs.lib.mkOverride 10 ''
      # Local Unix socket connections – trust for simplicity
      local all all trust
      # IPv4 local connections – require password (SCRAM)
      host all all 127.0.0.1/32 scram-sha-256
      # IPv6 local connections
      host all all ::1/128 scram-sha-256
    '';
    ensureDatabases = [ "eng_ara_dict" ];
    ensureUsers = [
      {
        name = "tau";
        ensureClauses = {
          createdb = true;
          password = "SCRAM-SHA-256$4096:1Yvu5Fg+agkqS+rugqp1/Q==$dAdakUkYUs3myh5RkqVc3+0W964fxtFN4IDtxXc628E=:/1SdElNxIZKeSfwqMUkyQem9MyUIK+wk0/7JKVHIN9M=";
        };
      }
    ];
  };
}
