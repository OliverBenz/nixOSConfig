{ config, lib, pkgs,  ... } :
{
  services.fprintd.enable = true;
  services.fprintd.package = pkgs.fprintd;

  security.pam.services.login.fprintAuth = false;
  # similarly to how other distributions handle the fingerprinting login
  security.pam.services.gdm-fingerprint = lib.mkIf (config.services.fprintd.enable) {
    text = ''
      auth       sufficient                  pam_unix.so try_first_pass likeauth nullok
      auth       sufficient                  ${pkgs.fprintd}/lib/security/pam_fprintd.so
      auth       required                    pam_shells.so
      auth       requisite                   pam_nologin.so
      auth       requisite                   pam_faillock.so      preauth
      auth       optional                    pam_permit.so
      auth       required                    pam_env.so
      auth       [success=ok default=1]      ${pkgs.gnome.gdm}/lib/security/pam_gdm.so
      auth       optional                    ${pkgs.gnome.gnome-keyring}/lib/security/pam_gnome_keyring.so
  
      account    include                     login
  
      password   required                    pam_deny.so
  
      session    include                     login
      session    optional                    ${pkgs.gnome.gnome-keyring}/lib/security/pam_gnome_keyring.so auto_start
    '';
  };
}
