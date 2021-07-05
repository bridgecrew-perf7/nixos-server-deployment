{ config, pkgs, ... }:

{

  users.users = {
    root = {
       openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAutAQ75uh0tmb4kROCdTfWWtG9Iqe3mqIs47wRkFTxzi3+9hgf0S13JuFHuj/wDcd4kMlEEvzm6n73FcxQLzKtqCsJOBQOMlxxdvof6QzqoWt0PtW7N11XzMP/P7zN+s/2+jqcCUiJX1+6AKs0FW2UL1zXxD1xmV9AbsptXzg1ipKi0N36y0/znOvwCrrp6nl8iMdfqd64V/oLWGmYp54zWkWOoXryIUcIgMCgJcbmCxBAizMRUqXARdxc26WfiHIRCVsbMptYh1S7kOtrYkFGsNnWAm6uYQKCJ3ZIoL4L6gp9N2PusyTgINsvJtMfIdV+pz6qOwHjiwhKRThHTYJ7Q== dani@mynuc" ];
    };

    dani =  {
      group = "users";
      home = "/home/dani";
      createHome = true;
      isNormalUser = true;
      useDefaultShell = true;
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
      openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAutAQ75uh0tmb4kROCdTfWWtG9Iqe3mqIs47wRkFTxzi3+9hgf0S13JuFHuj/wDcd4kMlEEvzm6n73FcxQLzKtqCsJOBQOMlxxdvof6QzqoWt0PtW7N11XzMP/P7zN+s/2+jqcCUiJX1+6AKs0FW2UL1zXxD1xmV9AbsptXzg1ipKi0N36y0/znOvwCrrp6nl8iMdfqd64V/oLWGmYp54zWkWOoXryIUcIgMCgJcbmCxBAizMRUqXARdxc26WfiHIRCVsbMptYh1S7kOtrYkFGsNnWAm6uYQKCJ3ZIoL4L6gp9N2PusyTgINsvJtMfIdV+pz6qOwHjiwhKRThHTYJ7Q== dani@mynuc" ];
      hashedPassword = "$6$Od3KhFA84o$yvibRWdsFxu/M2pHurVg2Frz8VHcP4z5eOVOKb8AzNQCB8oPXF5LxKe88mcuceev0uitt0bvBraX4TiOY/Co20";
    };
  };

}
