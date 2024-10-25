{ inputs, pkgs, ... }: {

  #setup waybar
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = {
      mainBar = {
        output = [
          "*"
        ];
        layer = "top";
        position = "bottom";
        margin = "5px";
        height = 32;
        modules-left = [ "hyprland/workspaces" "hyprland/language" "user" ];
        modules-center = [ "hyprland/window" "privacy" ];
        modules-right = [ "tray" "cpu" "temperature" "memory" "disk" "clock" ];
      };
    };
    style = ''
      * {
        border: none;
        border-radius: 5px;
        font-family: "JetBrainsMono Nerd Font";
        font-weight: bold;
        font-size: 11px;
        min-height: 11px;
      }
      window#waybar {
        background: transparent;
      }
      tooltip {
        background: #865A7B;
        color: #865A7B;
        border-radius: 7px;
        border-width: 3px;
      }
      #privacy,
      #window,
      #taskbar,
      #tray,
      #clock,
      #user,
      #temperature,
      #pulseaudio,
      #memory,
      #disk,
      #cpu,
      #battery,
      #language,
      #workspaces button {
          box-shadow: none;
	        text-shadow: none;
          padding: 0px;
          border-radius: 9px;
          margin-top: 3px;
          margin-bottom: 3px;
          margin-left: 0px;
          padding-left: 3px;
          padding-right: 3px;
          margin-right: 0px;
          color: #cdd6f4;
          animation: ws_normal 20s ease-in-out 1;
      }
      #workspaces button.active {
          background: #a6adc8;
          color: #313244;
          margin-left: 3px;
          padding-left: 12px;
          padding-right: 12px;
          margin-right: 3px;
          animation: ws_active 20s ease-in-out 1;
          transition: all 0.4s cubic-bezier(.55,-0.68,.48,1.682);
      }
      #workspaces button:hover {
          background: #f5c2e7;
          color: #313244;
          animation: ws_hover 20s ease-in-out 1;
          transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
      }
      #taskbar button {
          box-shadow: none;
	        text-shadow: none;
          padding: 0px;
          border-radius: 9px;
          margin-top: 3px;
          margin-bottom: 3px;
          margin-left: 0px;
          padding-left: 3px;
          padding-right: 3px;
          margin-right: 0px;
          color: @wb-color;
          animation: tb_normal 20s ease-in-out 1;
      }
      #taskbar button.active {
          background: #a6adc8;
          color: @wb-act-color;
          margin-left: 3px;
          padding-left: 12px;
          padding-right: 12px;
          margin-right: 3px;
          animation: tb_active 20s ease-in-out 1;
          transition: all 0.4s cubic-bezier(.55,-0.68,.48,1.682);
      }
      #taskbar button:hover {
          background: #f5c2e7;
          color: @wb-hvr-color;
          animation: tb_hover 20s ease-in-out 1;
          transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
      }
      #tray menu * {
          min-height: 16px
      }
      #tray menu separator {
          min-height: 10px
      }
    '';
  };

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

  # notifications
  services.dunst = {
    package = pkgs.dunst;
    enable = true;
    settings = {
      global = {
        indicate_hidden = true;
        shrink = false;
        sort = true;
        word_wrap = false;
        ignore_newline = false;
        stack_duplicates = true;
        hide_duplicate_count = true;
        show_indicators = false;
        startup_notification = true;
        ignore_dbusclose = false;
        follow = "mouse";
        font = "gohufont 9";
        markup = "full";
        alignment = "center";
        vertical_alignment = "center";
        show_age_threshold = "-1";
        ellipsize = "middle";
        icon_position = "left";
        title = "Dunst";
        class = "Dunst";
        verbosity = "mesg";
        mouse_left_click = "close_current";
        mouse_middle_click = "do_action";
        mouse_right_click = "do_action";
        transparency = 40;
        notification_height = 5;
        separator_height = 3;
        padding = 5;
        horizontal_padding = 1;
        frame_width = 2;
        idle_threshold = 0;
        line-height = 0;
        history_length = 20;
        corner_radius = 15;
        geometry = "300x30-5+60";
        format = ''<b>%a</b>\n<i>%s</i>\n%b'';
        dmenu = "${pkgs.fuzzel}/bin/fuzzel";
        browser = "${pkgs.firefox}/bin/firefox -new-tab";
        frame_color = "#2C0C2E";
      };
      urgency_normal = {
        background = "#885A7B";
        foreground = "#34142F";
        timeout = 5;
      };
      urgency_critical = {
        background = "#966A8D";
        foreground = "#702741";
        timeout = 0;
      };
    };
  };

}
