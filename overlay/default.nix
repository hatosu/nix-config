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

    # pin version of papirus-icon-theme
    papirus-icon-theme = prev.papirus-icon-theme.overrideAttrs (old: {
      src = prev.fetchFromGitHub {
        owner = "PapirusDevelopmentTeam";
        repo = "papirus-icon-theme";
        rev = "b0e826bbf142d51c7a019d13eb50d81f112fa310";
        hash = "sha256-nhmaHBove1K0a5+pDFzxNckoDgs7b0pn0IPxzNIRhus=";
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
