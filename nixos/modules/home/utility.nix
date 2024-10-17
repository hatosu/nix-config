{config,pkgs,...}:{

  # app-menu
  programs.fuzzel = { package = pkgs.fuzzel; enable = true; settings = {
      main = {
        terminal = "${pkgs.foot}/bin/foot";
        layer = "overlay";
        font = "gohufont:size=10";
        dpi-aware = true;
        prompt = "󱗼";
        icon-theme = "Papirus-Dark";
        icons-enabled = true;
        fields = "filename,name,generic";
        match-mode = "fzf";
        sort-result = true;
        show-actions = true;
        anchor = "center";
        x-margin = 0;
        y-margin = 0;
        lines = 6;
        line-height = 25;
        inner-pad = 5;
        image-size-ratio = 80;
        letter-spacing = 0;
        exit-on-keyboard-focus-loss = false;
      };
      border = {
        width = 2;
        radius = 7;
      };
      colors = {
        background = "885A7E33";
        text = "";
        prompt = "";
        placeholder = "";
        input = "";
        match = "";
        selection = "";
        selection-text = "";
        selection-match = "";
        border = "";
      };
    };
  };

}
