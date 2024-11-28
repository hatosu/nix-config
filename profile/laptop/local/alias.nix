{ pkgs, ... }: { environment = { shellAliases = {

# general
logout = "kill -9 -1";
hist = "history | grep";
fixper = "sudo chmod -R a+rwx";
skip = "playerctl next";
pause = "playerctl play-pause";
back = "playerctl previous";
v = "nvim";
y = "yazi";
m = "mpv";
c = "clear";

# nixpkgs
scan = "${pkgs.stable.vulnix}/bin/vulnix --system --verbose";
dupe = "${pkgs.stable.rmlint}/bin/rmlint";
anime = "${pkgs.ani-cli}/bin/ani-cli -q 1080p";
brightness = "${pkgs.stable.brightnessctl}/bin/brightnessctl";
chatgpt = "${pkgs.stable.tgpt}/bin/tgpt";
phind = "${pkgs.stable.tgpt}/bin/tgpt --provider phind";
disk = "${pkgs.stable.ncdu}/bin/ncdu";
audio = "${pkgs.stable.ponymix}/bin/ponymix";
drag = "${pkgs.stable.ripdrag}/bin/ripdrag -r";
img = "${pkgs.stable.imagemagick}/bin/magick";
opt = "${pkgs.stable.image_optim}/bin/image_optim";
home = "cd && nvim $(${pkgs.stable.skim}/bin/sk)";
conf = "cd ~/files/config && nvim $(${pkgs.stable.skim}/bin/sk) && cd";
pget = "${pkgs.stable.pirate-get}/bin/pirate-get -T -S ~/Downloads";
tor = "${pkgs.stable.aria2}/bin/aria2";
metaclean = "${pkgs.stable.metadata-cleaner}/bin/metadata-cleaner";
vidget = "${pkgs.stable.yt-dlp}/bin/yt-dlp";
audget = "${pkgs.stable.yt-dlp}/bin/yt-dlp -x --no-keep-video";
spotget = "${pkgs.stable.spotdl}/bin/spotdl --format mp3";
browse = "${pkgs.stable.w3m}/bin/w3m";
radio = "${pkgs.stable.radio-cli}/bin/radio-cli -s japan";
lofi = "${pkgs.stable.radio-cli}/bin/radio-cli -s lofi";
pings = "${pkgs.stable.gping}/bin/gping";
task = "${pkgs.stable.htop}/bin/htop";
tasks = "${pkgs.stable.glances}/bin/glances";
vimtutor = "${pkgs.stable.vim}/bin/vimtutor";
ff = "${pkgs.stable.fastfetch}/bin/fastfetch";
f = "cd $(dirname $(${pkgs.stable.fd}/bin/fd --type file | ${pkgs.stable.skim}/bin/sk))";

# notes
lch = "sudoedit /home/hatosu/files/config/misc/notes/linux.txt";
nch = "sudoedit /home/hatosu/files/config/misc/notes/nix.txt";
vch = "sudoedit /home/hatosu/files/config/misc/notes/vim.txt";
tch = "sudoedit /home/hatosu/files/config/misc/notes/todo.txt";
fch = "sudoedit /home/hatosu/files/config/misc/notes/features.txt";
pch = "sudoedit /home/hatosu/files/config/misc/notes/production.txt";

};};}
