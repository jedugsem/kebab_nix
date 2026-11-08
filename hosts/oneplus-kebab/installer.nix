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

  environment.systemPackages = [
    pkgs.git
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  vanilla-mobile.installer = {
    enable = true;
    enableCrossPkgs = true;
    buildSystem = "x86_64-linux";
  };

  system.stateVersion = "26.05";
}
