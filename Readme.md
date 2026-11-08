# Installation
```
./build_uboot.sh
./flash_uboot.sh
./build_image.sh
```
# wait for fastboot
```
./flash_image.sh
```
# wait for tty
```
ssh nixos@172.16.42.1
git clone https://github.com/jedugsem/kebab_nix
cd kebab_nix
sudo nixos-rebuild switch --flake .
sudo reboot
```
# Passwort is 1234
