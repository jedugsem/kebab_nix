nix build --option extra-substituters https://vanilla-mobile-nixos.cachix.org .#nixosConfigurations.xiaomi-beryllium.config.system.build.diskoImagesScript 
bash -c 'read -s -p "LUKS Password: " p; tmp=$(mktemp); trap "rm \"$tmp\"" EXIT; echo "$p" > "$tmp"; ./result --pre-format-files "$tmp" /tmp/nixos-root.key'
