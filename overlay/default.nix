{ inputs, }: {

  additions = final: _prev: import ../pkgs final.pkgs;
  modifications = final: prev: {

    # allow waybar to work smoothly on hyprland
    waybar = prev.waybar.overrideAttrs (oldAttrs: rec {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    });

    # enable wlr support for flameshot
    flameshot = prev.flameshot.override {
      enableWlrSupport = true;
    };

    # modify ciano desktop entry
    ciano = prev.ciano.overrideAttrs (oldAttrs: {
      postInstall = (oldAttrs.postInstall or "") + ''
        substituteInPlace $out/share/applications/com.github.robertsanseries.ciano.desktop \
        --replace "Name=Ciano" "Name=Convert"
      '';
    });

    # pin version of cliphist
    cliphist = prev.cliphist.overrideAttrs (old: {
      src = prev.fetchFromGitHub {
        owner = "sentriz";
        repo = "cliphist";
        rev = "8c48df70bb3d9d04ae8691513e81293ed296231a";
        hash = "sha256-tImRbWjYCdIY8wVMibc5g5/qYZGwgT9pl4pWvY7BDlI=";
      };
    });

  };

  # add pkgs.stable.<package>
  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
  
}
