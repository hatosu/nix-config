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

---
how to install:
```bash
nix --experimental-features "nix-command flakes" run --no-write-lock-file github:hatosu/config#install
reboot
nixos-rebuild switch --flake --no-write-lock-file github:hatosu/config#<insert-profile-of-choice>
```
