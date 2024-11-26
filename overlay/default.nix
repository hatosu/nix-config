{ inputs }:
{

  additions = final: _prev: import ../pkgs final.pkgs;

  modifications = final: prev: {

    waybar = prev.waybar.overrideAttrs (oldAttrs: rec {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    });

    flameshot = prev.flameshot.override {
      enableWlrSupport = true;
    };

    ciano = prev.ciano.overrideAttrs (oldAttrs: {
      src = prev.fetchFromGitHub {
        owner = "robertsanseries";
        repo = "ciano";
        rev = "31ae62057660e327eaf5e358a31c2364b62addbf";
        hash = "sha256-QVXvcBTyY82AZbAqCeRSEhECm4k9y/3zv0pBkuk0W9I=";
      };
      postInstall =
        (oldAttrs.postInstall or "")
        + ''
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
