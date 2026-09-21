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
    ensureDatabases = [ "tasrif_db" ];
    ensureUsers = [
      {
        name = "tau";
        ensureClauses = {
          createdb = true;
          password = "SCRAM-SHA-256$4096:BQfaF80MKlFGJTpYM5MUsQ==$iGNS5e/zLmOQryS1i0o7g6o0sYEOy9NEkY1GqwX2BFk=:KAz0xW69QumqDcJ9XGlVF2f2/3TDFDS4RtBg3FEq2CY=";
        };
      }
    ];
  };
}