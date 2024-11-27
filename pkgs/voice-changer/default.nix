{ pkgs ? import <nixpkgs> {}, }: let

  name = "voice-changer";

  desktopName = "Voice Changer";

  src = pkgs.fetchFromGitHub {
    owner = "w-okada";
    repo = "voice-changer";
    rev = "66cbbeed1a819e993d179fdb63ae14b0e898cc13";
    hash = "sha256-X+McQ3+bWslaZBVF79rz+KVfBP9I0bZo3qlbF0pJwFI=";
  };

  torch = pkgs.fetchurl {
    url = "https://repo.radeon.com/rocm/manylinux/rocm-rel-5.7/torch-2.0.1%2Brocm5.7-cp310-cp310-linux_x86_64.whl";
    sha256 = "sha256-fd/aTaIBs7gUfSGllaW8obb5cyqtDB6fBpjWNAC9Hx8=";
  };

  torchv = pkgs.fetchurl {
    url = "https://repo.radeon.com/rocm/manylinux/rocm-rel-5.7/torchvision-0.15.2%2Brocm5.7-cp310-cp310-linux_x86_64.whl";
    sha256 = "sha256-RyKXRW9wtkVuX5iCkPUJgG2sLn1EPUw40dh5CgJmeTY=";
  };

  zip = pkgs.fetchurl {
    url = "https://cdn3.filehaus.su/files/1732687883_57524/conda.zip";
    sha256 = "17ngdva8c06iv9hghpbwmn291s2h5235xy5pr26cjpm2agv4qnp2";
  };

  shell = pkgs.runCommand "shell" {} ''
    mkdir -p $out/temp
    ${pkgs.unzip}/bin/unzip ${zip} -d "$out/temp"
    cp -rf $out/temp/.conda/* $out
    rm -rf $out/temp
  '';

  install = let p = "${shell}/bin/python"; in pkgs.runCommand "install" {} ''
    ${p} conda create --name voicechanger python=3.10.9
    ${p} conda activate voicechanger
    mkdir -p ./voice-changer
    cp -rf ${src}/* ./voice-changer
    cd ./voice-changer
    ${p} pip3 install --force-reinstall ${torch} ${torchv}
    cd ./server
    ${p} pip install -r requirements.txt
    cd
  '';

  script = pkgs.writeShellScriptBin name ''
    PATH=$PATH:${pkgs.python312.withPackages(ps: with ps; [ pip toolz setuptools srt ])}/bin:${pkgs.conda}/bin
    python3 ${install}/voice-changer/server/MMVCServerSIO.py
  '';

  icon = builtins.fetchurl {
    url = "https://files.catbox.moe/h76mnm.png";
    sha256 = "15q9imzlxs2xn4cfcw1gc5a1xy2icxnjmsp9l48m8gwglhqpqgwd";
  };

  item = pkgs.makeDesktopItem {
    exec = "${script}/bin/${name} %U";
    inherit icon name desktopName;
  };

in pkgs.symlinkJoin {
  paths = [
    script
    item
  ];
  inherit name;
}
