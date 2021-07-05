{ config, pkgs, ... }:

{
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  
  services.openssh.passwordAuthentication = false;

}
