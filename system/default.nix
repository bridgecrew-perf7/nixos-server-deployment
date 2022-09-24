{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./grub.nix
    ./network.nix
  ];
  
  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Configure keymap in X11
  services.xserver.layout = "de";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    #docker docker-compose
    tmux
  ];

}
