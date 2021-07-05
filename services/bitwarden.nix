{ pkgs, ... }:
let
  port = 8812;
in {
  services.bitwarden_rs = {
    enable = true;
    dbBackend = "postgresql";
    config.signups_allowed = false;
    config.rocketPort = port;
    config.domain = "https://bw.whatdaheck.de";
    #config.databaseUrl = "postgresql://bitwardenuser:${dbPassword}@localhost/bitwarden";
    config.databaseUrl = "postgresql:///bitwarden";
    config.websocket_enabled = true;
  };

  systemd.services.bitwarden_rs.after = [ "postgresql.service" ];

  services.postgresql = {
    enable = true;
    ensureDatabases = [ "bitwarden" ];
    ensureUsers = [ { name = "bitwarden_rs"; ensurePermissions."DATABASE bitwarden" = "ALL PRIVILEGES"; } ];
    #initialScript = pkgs.writeText "postgresql-init.sql" ''
    #  CREATE DATABASE bitwarden;
    #  CREATE USER bitwardenuser WITH PASSWORD '${dbPassword}';
    #  GRANT ALL PRIVILEGES ON DATABASE bitwarden TO bitwardenuser;
    #'';
  };

  # enable postgresql backup service for "bitwarden_rs" database
  services.postgresqlBackup = {
    enable = true;
    databases = [ "bitwarden_rs" ];
  };

  # Enable nginx
  services.nginx = {
    enable = true;
  
    virtualHosts."bw.whatdaheck.de" ={
      forceSSL = true;
      enableACME = true;

      locations."/" = {
        proxyPass = "http://localhost:8812";
        proxyWebsockets = true;
      };
      locations."/notifications/hub" = {
        proxyPass = "http://localhost:3012";
        proxyWebsockets = true;
      };
      locations."/notifications/hub/negotiate" = {
        proxyPass = "http://localhost:8812";
        proxyWebsockets = true;
      };
    };
  };
}
