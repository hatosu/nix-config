{ inputs, }: {

  additions = final: _prev: import ../pkgs final.pkgs;

  modifications = final: prev: {

    waybar = prev.waybar.overrideAttrs (oldAttrs: rec {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    });

    flameshot = prev.flameshot.override {
      enableWlrSupport = true;
    };

    ciano = prev.ciano.overrideAttrs (oldAttrs: {
      postInstall = (oldAttrs.postInstall or "") + ''
        substituteInPlace $out/share/applications/com.github.robertsanseries.ciano.desktop --replace "Name=Ciano" "Name=Convert"
      '';
    });

  };

  fresh-packages = final: _prev: {
    fresh = import inputs.nixpkgs-fresh {
      system = final.system;
      config.allowUnfree = true;
      config.allowBroken = true;
    };
  };

  latest-packages = final: _prev: {
    latest = import inputs.nixpkgs-latest {
      system = final.system;
      config.allowUnfree = true;
      config.allowBroken = true;
    };
  };

  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.system;
      config.allowUnfree = true;
    };
  };

  pinned-packages = final: _prev: {
    pinned = import inputs.nixpkgs-pinned {
      system = final.system;
      config.allowUnfree = true;
    };
  };

}
