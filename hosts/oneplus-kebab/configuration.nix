{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./disko-ext4.nix
    ./hconf.nix
  ];


  networking.hostName = "phone"; # Define your hostname.

  virtualisation.waydroid.enable = true;
  # Newer kernel versions may need
  virtualisation.waydroid.package = pkgs.waydroid-nftables;




nix.settings.experimental-features = [ "nix-command" "flakes" ];

services.tlp.enable = true;
services.power-profiles-daemon.enable = false;
  users.users.me = {
    isNormalUser = true;
    # Remember to change this after booting!
    initialPassword = "1234";
    extraGroups = [
      "wheel"
      "networkmanager"
      "feedbackd"
    ];
  };

  services.openssh = {
   enable = true;
   # Only allowing SSH over USB.
   openFirewall = false;
   listenAddresses = [
     {
       #addr = "172.16.42.1";
       addr = vanilla-mobile.usb-gadget.network.serverAddress;
     }
   ];
 };
  
       #addr = vanilla-mobile.usb-gadget.network.serverAddress;
  vanilla-mobile.mobile-config-firefox.enable = true;
  
  services.desktopManager.phosh = {
    enable = true;
    user = "me";
    group = "users";
  };

  environment.systemPackages = [
    pkgs.alacritty
    pkgs.firefox
    pkgs.nautilus
    pkgs.telegram-desktop
    pkgs.snapshot
    pkgs.git
    pkgs.wl-clipboard
    # You can also configure declcaratively with `programs.dconf`.
    pkgs.phosh-mobile-settings
 ];

  system.stateVersion = "26.05"; # Did you read the comment?
}
