{ pkgs, stdenv, ... }: let uncropped-wallpaper = pkgs.fetchurl {

#step 1: insert wallpaper here ↓
url = "https://files.catbox.moe/daj83i.mp4";

#step 2: run "nix-prefetch-url <link>" & put sha code here ↓
sha256 = "05m4vgak4pniiy7751m8hn9f4va322nlmkg49kll923byknibcvq";};

#step 3: enter monitor width
width = "2560";

#step 4: enter monitor height, rebuild, and try using the "wallpaper" command >x3
height = "1080";

crop = pkgs.runCommand "crop" {} ''
mkdir -p $out/videos
${pkgs.ffmpeg}/bin/ffmpeg -i ${uncropped-wallpaper} -vf "scale=${width}:${height}:force_original_aspect_ratio=increase,crop=${width}:${height}" $out/videos/wallpaper.mp4'';
wallpaper = pkgs.writeShellScriptBin "wallpaper" ''
pkill mpvpaper
${pkgs.mpvpaper}/bin/mpvpaper -vs -o "no-audio loop" '*' ${crop}/videos/wallpaper.mp4
''; in { environment.systemPackages = [ wallpaper ]; }

