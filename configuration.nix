# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, pkgs-unstable, nixpkgs-unstable, ... }:
{
  imports =
  [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    oliver = {
      isNormalUser = true;
      description = "Oliver Benz";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = [
        # Essential
        pkgs.brave
        pkgs.kate
        pkgs.mpv
        pkgs.gthumb
        pkgs.flameshot
        pkgs.libsForQt5.okular
        pkgs.krita

        # Work
        pkgs.slack
        pkgs.whatsapp-for-linux
        pkgs.bitwarden
        pkgs-unstable.mathematica
        pkgs.libreoffice
        pkgs.thunderbird
        pkgs.calibre
        pkgs.onedrive

        # Recreational
        pkgs.discord
        pkgs.obs-studio
        pkgs.spotify

        # Development
        pkgs.jetbrains.clion
        pkgs.vscode
        pkgs.gcc13
        pkgs.sqlitecpp
        pkgs.cmake
        pkgs.gnumake
        pkgs.ninja
        pkgs.sqlite
        pkgs.qt6.full
      ];
    };

    guest = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      packages = with pkgs; [
        flameshot
      ];
      initialPassword = "guest";
    };
    
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;	

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    man-db
    man-pages
    htop
    tree
    gparted
    unzip
    powertop
    libsForQt5.kcalc
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable SSH agent
  programs.ssh.startAgent = true;
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
