{ pkgs, config, pkgs-unstable, ... }: {
  services.onedrive.enable = true;
  services.onedrive.package = pkgs-unstable.onedrive;
}
  
