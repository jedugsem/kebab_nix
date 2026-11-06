{
  inputs = {
    # You should use `nixos-unstable` as your nixpkgs version for this.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # Don't set `inputs.nixpkgs.follows`, to avoid cache misses.
    vanilla-mobile-nixos.url = "github:jedugsem/vanilla-mobile-nixos/kebab";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      nixpkgs,
      vanilla-mobile-nixos,
      disko,
      ...
    }:
    {
      # Create a NixOS configuration for `xiaomi-beryllium`.
      nixosConfigurations.oneplus-kebab = nixpkgs.lib.nixosSystem {
        modules = [
          # Import the `vanilla-mobile` module.
          vanilla-mobile-nixos.nixosModules.vanilla-mobile
          # Import the `disko` module.
          disko.nixosModules.disko
          # Import the example config.
          ./hosts/oneplus-kebab/configuration.nix
        ];
      };
    };
}
