{ pkgs, ... }: { environment = { shellAliases = let pkg = pkgs.stable; in {

# general
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
scan = "${pkg.vulnix}/bin/vulnix --system --verbose";
dupe = "${pkg.rmlint}/bin/rmlint";
anime = "${pkg.ani-cli}/bin/ani-cli -q 1080p";
brightness = "${pkg.brightnessctl}/bin/brightnessctl";
chatgpt = "${pkg.tgpt}/bin/tgpt";
phind = "${pkg.tgpt}/bin/tgpt --provider phind";
disk = "${pkg.ncdu}/bin/ncdu";
audio = "${pkg.ponymix}/bin/ponymix";
tasks = "${pkg.glances}/bin/glances";
drag = "${pkg.ripdrag}/bin/ripdrag -r";
rembg = "${pkg.backgroundremover}/bin/backgroundremover";
img = "${pkg.imagemagick}/bin/magick";
opt = "${pkg.image_optim}/bin/image_optim";
home = "cd && nvim $(${pkg.skim}/bin/sk)";
conf = "cd /etc/nixos && nvim $(${pkg.skim}/bin/sk) && cd";
pget = "${pkg.pirate-get}/bin/pirate-get -T -S ~/Downloads";
tor = "${pkg.aria2}/bin/aria2";
metaclean = "${pkg.metadata-cleaner}/bin/metadata-cleaner";
vidget = "${pkg.yt-dlp}/bin/yt-dlp";
audget = "${pkg.yt-dlp}/bin/yt-dlp -x --no-keep-video";
spotget = "${pkg.spotdl}/bin/spotdl --format mp3";
browse = "${pkg.w3m}/bin/w3m";
gping = "${pkg.gping}/bin/gping";
ff = "${pkg.fastfetch}/bin/fastfetch";
f = "cd $(dirname $(${pkg.fd}/bin/fd --type file | ${pkg.skim}/bin/sk))";

# notes
lch = "sudoedit /etc/nixos/misc/notes/linux.txt";
nch = "sudoedit /etc/nixos/misc/notes/nix.txt";
vch = "sudoedit /etc/nixos/misc/notes/vim.txt";
tch = "sudoedit /etc/nixos/misc/notes/todo.txt";
fch = "sudoedit /etc/nixos/misc/notes/features.txt";
kch = "sudoedit /etc/nixos/misc/notes/kden.txt";

};};}
