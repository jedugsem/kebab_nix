
{
  pkgs,
  lib,
  ...
}:
{

  vanilla-mobile.device.oneplus-kebab = {
    enable = true;
  };
  
  vanilla-mobile.cache.enable = true;

  nixpkgs.config.allowUnfreePackages = [
    "oneplus-kebab-firmware"
  ];
}
