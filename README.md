how to install:
```bash
# run this within usb installer
nix --experimental-features "nix-command flakes" run github:hatosu/config#install

# reboot, and unplug usb stick
reboot

# choose profile, and rebuild
nixos-rebuild switch --flake github:hatosu/config#<insert-profile-of-choice>
```
---
<br />
<div align="center">
<img src="https://github.com/hatosu/config/blob/main/showcase.gif?raw=true" />
</div>

<h1 align="center">Hatosu NixOS (entire pc)</h1>

<div align="center">

**[<kbd> <br> Modules <br> </kbd>](/module/)** 
**[<kbd> <br> Hosts <br> </kbd>](/profile/)** 
**[<kbd> <br> Overlays <br> </kbd>](/overlay/)** 
**[<kbd> <br> Packages <br> </kbd>](/pkgs/)**

</div>
