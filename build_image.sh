nix build --option extra-substituters https://vanilla-mobile-nixos.cachix.org .#nixosConfigurations.installer.config.system.build.diskoImagesScript -L --keep-failed 
