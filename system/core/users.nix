{ pkgs, pkgs-unstable, ... } : 
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    oliver = {
      isNormalUser = true;
      description = "Oliver Benz";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = [
        # Essential
        pkgs.home-manager
        pkgs.brave
        pkgs.firefox
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
        # pkgs-unstable.mathematica
        pkgs.libreoffice
        pkgs.thunderbird
        pkgs.calibre
        pkgs.onedrive

        # Recreational
        pkgs.discord
        pkgs.obs-studio
        pkgs.spotify
        pkgs.stellarium

        # Development
        pkgs.jetbrains.clion
        pkgs.vscode
        pkgs.gcc13
        pkgs.cmake
        pkgs.gnumake
        pkgs.ninja
        pkgs.qt6.full
        pkgs.sqlite
        pkgs.gtest
        pkgs.tcl
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

  environment.variables = {
    EDITOR = "vim";
    SQLITE3_OUT = "${pkgs.sqlite.out}"; # Library files
    SQLITE3_DEV = "${pkgs.sqlite.dev}"; # Header files
    SQLITE3_BIN = "${pkgs.sqlite.bin}"; # Binanry files
  };
}
