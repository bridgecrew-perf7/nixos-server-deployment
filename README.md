# nixos-server-deployment
Full NixOS deployment for VPS w/ Bitwarden, PSQL and NGINX

# deploy-host.sh
Deploys localhost based on nix files

## Usage
```
sudo ./deploy-host <test|switch>

Options:
  test      Deploy nix files on localhost for testing (nixos-rebuild test)
  switch    Deploy nix files on localhost permanently (nixos-rebuild switch)
```
