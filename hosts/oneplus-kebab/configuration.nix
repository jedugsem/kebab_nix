{
  pkgs,
  ...
}:
{
  imports = [
    ./disko-ext4.nix
  ];

  # Remove this after the initial flash.
  # vanilla-mobile.installer = {
  #   enable = true;
  #   enableCrossPkgs = true;
  #   buildSystem = "x86_64-linux";
  # };

  # vanilla-mobile.device.xiaomi-beryllium = {
  #   enable = true;
  #   displayPanel = "tianma";
  #   # Set this to either "ebbg" or "tianma" depending on your display panel.
  # };


services.tlp.enable = true;
services.power-profiles-daemon.enable = false;
  users.users.me = {
    isNormalUser = true;
    # Remember to change this after booting!
    initialPassword = "147258";
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
       addr = "172.16.42.1";
     }
   ];
 };
  
       #addr = vanilla-mobile.usb-gadget.network.serverAddress;
  vanilla-mobile.mobile-config-firefox.enable = true;
  
  services.xserver.desktopManager.phosh = {
    enable = true;
    user = "me";
    group = "users";
  };

  environment.systemPackages = [
    pkgs.alacritty
    # You can also configure declcaratively with `programs.dconf`.
    pkgs.phosh-mobile-settings
  ];

  vanilla-mobile.device.oneplus-kebab = {
    enable = true;
    #displayPanel = "tianma";
    # Set this to either "ebbg" or "tianma" depending on your display panel.
  };
  
  # Use the cache, so you don't have to spend hours building kernels.
  # Security wise, you are already trusting the committer to `vanilla-mobile-nixos`,
  # @JuneStepp on your mobile device. Adding the cache extends that trust to
  # GitHub Actions where the packages are built and signed.
  vanilla-mobile.cache.enable = true;

  # Allow using the phone's firmware.
  nixpkgs.config.allowUnfreePackages = [
    "xiaomi-beryllium-firmware"
    "oneplus-sdm845-firmware"
    "oneplus-kebab-firmware"
  ];

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?
}
