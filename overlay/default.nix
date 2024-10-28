{ inputs, }: {

  # create custom overlays ↓

  additions = final: _prev: import ../pkgs final.pkgs;
  modifications = final: prev: {

    # allows waybar to work smoothly on hyprland
    waybar = prev.waybar.overrideAttrs (oldAttrs: rec {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    });

    # enables wlr support for flameshot
    flameshot = prev.flameshot.override {
      enableWlrSupport = true;
    };

    # modifies ciano desktop entry
    ciano = prev.ciano.overrideAttrs (oldAttrs: {
      postInstall = (oldAttrs.postInstall or "") + ''
        substituteInPlace $out/share/applications/com.github.robertsanseries.ciano.desktop \
          --replace "Name=Ciano" "Name=Convert"
      '';
    });

  };

  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
  
}


