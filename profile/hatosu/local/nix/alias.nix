{ pkgs, ... }: { environment = { shellAliases = {

# general
hist = "history | grep";
power = "shutdown -P now";
try = "nix-shell -p";
trace = "sudo nixos-rebuild switch --show-trace --verbose --print-build-logs --flake /etc/nixos#desktop";
s = "playerctl next";
p = "playerctl play-pause";
b = "playerctl previous";
v = "nvim";
y = "yazi";
m = "mpv";
c = "clear";

# nixpkgs
scan = "${pkgs.vulnix}/bin/vulnix --system --verbose";
dupe = "${pkgs.rmlint}/bin/rmlint";
anime = "${pkgs.ani-cli}/bin/ani-cli -q 1080p";
brightness = "${pkgs.brightnessctl}/bin/brightnessctl";
chatgpt = "${pkgs.tgpt}/bin/tgpt";
phind = "${pkgs.tgpt}/bin/tgpt --provider phind";
color = "${pkgs.okolors}/bin/okolors";
disk = "${pkgs.ncdu}/bin/ncdu";
audio = "${pkgs.ponymix}/bin/ponymix";
tasks = "${pkgs.glances}/bin/glances";
drag = "${pkgs.ripdrag}/bin/ripdrag -r";
rembg = "${pkgs.backgroundremover}/bin/backgroundremover";
img = "${pkgs.imagemagick}/bin/magick";
opt = "${pkgs.image_optim}/bin/image_optim";
home = "cd && nvim $(${pkgs.skim}/bin/sk)";
conf = "cd /etc/nixos && nvim $(${pkgs.skim}/bin/sk) && cd";
ff = "${pkgs.fastfetch}/bin/fastfetch";
f = "cd $(dirname $(${pkgs.fd}/bin/fd --type file | ${pkgs.skim}/bin/sk))";

# temporary
pget = "nix run nixpkgs#pirate-get -- -T -S ~/Downloads";
torbrowser = "nix run nixpkgs#tor-browser";
tor = "nix run nixpkgs#aria2 --";
metaclean = "nix run nixpkgs#metadata-cleaner --";
vidget = "nix run nixpkgs#yt-dlp --";
spotget = "nix run nixpkgs#spotdl -- --format mp3";
browse = "nix run nixpkgs#w3m --";
gping = "nix run nixpkgs#gping --";

# notes
lch = "sudoedit /etc/nixos/misc/notes/linux.txt";
nch = "sudoedit /etc/nixos/misc/notes/nix.txt";
vch = "sudoedit /etc/nixos/misc/notes/vim.txt";
tch = "sudoedit /etc/nixos/misc/notes/todo.txt";
fch = "sudoedit /etc/nixos/misc/notes/features.txt";

}; }; }
