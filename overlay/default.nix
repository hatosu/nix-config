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

  };

  # add pkgs.fresh.<package>
  fresh-packages = final: _prev: {
    fresh = import inputs.nixpkgs-fresh {
      system = final.system;
      config.allowUnfree = true;
      config.allowBroken = true;
    };
  };

  # add pkgs.latest.<package>
  latest-packages = final: _prev: {
    latest = import inputs.nixpkgs-latest {
      system = final.system;
      config.allowUnfree = true;
      config.allowBroken = true;
    };
  };

  # add pkgs.stable.<package>
  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.system;
      config.allowUnfree = true;
    };
  };

  # add pkgs.pinned.<package>
  pinned-packages = final: _prev: {
    pinned = import inputs.nixpkgs-pinned {
      system = final.system;
      config.allowUnfree = true;
    };
  };

}
