{config,pkgs,...}:{services.dunst={package=pkgs.dunst;enable=true;settings={

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
