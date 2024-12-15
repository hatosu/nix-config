{
  logotxt = builtins.toFile "logo.txt" ''
    $1  \\  $2\\ //
    $1 ==\\__$2\\/ $1//
    $2   //   $2\\$1//
    $2==//     $1//==
    $2 //$1\\$2___$1//
    $2// $1/\\  $2\\==
      $1// \\  $2\\
  '';

  classicuiconf = builtins.toFile "classicui.conf" ''
    Vertical Candidate List=False
    WheelForPaging=True
    Font="Sans 10"
    MenuFont="Sans 10"
    TrayFont="Sans Bold 10"
    TrayOutlineColor=#000000
    TrayTextColor=#ffffff
    PreferTextIcon=False
    ShowLayoutNameInIcon=True
    UseInputMethodLanguageToDisplayText=True
    Theme=catppuccin-mocha-pink
    DarkTheme=default-dark
    UseDarkTheme=False
    UseAccentColor=True
    PerScreenDPI=False
    ForceWaylandDPI=0
    EnableFractionalScale=True
  '';

  stylerasi = builtins.toFile "style.rasi" ''
    configuration {
    	modi:                       "drun";
        show-icons:                 true;
        display-drun:               "";
    	drun-display-format:        "{name}";
    }
    * {
        background:     #000000FF;
        background-alt: #101010FF;
        foreground:     #FFFFFFFF;
        selected:       #62AEEFFF;
        active:         #98C379FF;
        urgent:         #E06B74FF;
    }
    * {
        font: "Iosevka Nerd Font 10";
    }
    window {
        transparency:                "real";
        location:                    center;
        anchor:                      center;
        fullscreen:                  true;
        width:                       1366px;
        height:                      768px;
        x-offset:                    0px;
        y-offset:                    0px;
        enabled:                     true;
        margin:                      0px;
        padding:                     0px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @selected;
        background-color:            black / 10%;
        cursor:                      "default";
    }
    mainbox {
        enabled:                     true;
        spacing:                     100px;
        margin:                      0px;
        padding:                     100px 225px;
        border:                      0px solid;
        border-radius:               0px 0px 0px 0px;
        border-color:                @selected;
        background-color:            transparent;
        children:                    [ "inputbar", "listview" ];
    }
    inputbar {
        enabled:                     true;
        spacing:                     10px;
        margin:                      0% 25%;
        padding:                     18px;
        border:                      0px solid;
        border-radius:               10px;
        border-color:                @selected;
        background-color:            white / 5%;
        text-color:                  @foreground;
        children:                    [ "prompt", "entry" ];
    }
    prompt {
        enabled:                     true;
        background-color:            transparent;
        text-color:                  inherit;
    }
    textbox-prompt-colon {
        enabled:                     true;
        expand:                      false;
        str:                         "::";
        background-color:            transparent;
        text-color:                  inherit;
    }
    entry {
        enabled:                     true;
        background-color:            transparent;
        text-color:                  inherit;
        cursor:                      text;
        placeholder:                 "Search";
        placeholder-color:           inherit;
    }
    listview {
        enabled:                     true;
        columns:                     8;
        lines:                       4;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        fixed-height:                true;
        fixed-columns:               true;
        spacing:                     0px;
        margin:                      0px;
        padding:                     0px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @selected;
        background-color:            transparent;
        text-color:                  @foreground;
        cursor:                      "default";
    }
    scrollbar {
        handle-width:                5px ;
        handle-color:                @selected;
        border-radius:               0px;
        background-color:            @background-alt;
    }
    element {
        enabled:                     true;
        spacing:                     15px;
        margin:                      0px;
        padding:                     35px 10px;
        border:                      0px solid;
        border-radius:               15px;
        border-color:                @selected;
        background-color:            transparent;
        text-color:                  @foreground;
        orientation:                 vertical;
        cursor:                      pointer;
    }
    element normal.normal {
        background-color:            transparent;
        text-color:                  @foreground;
    }
    element selected.normal {
        background-color:            white / 5%;
        text-color:                  @foreground;
    }
    element-icon {
        background-color:            transparent;
        text-color:                  inherit;
        size:                        72px;
        cursor:                      inherit;
    }
    element-text {
        background-color:            transparent;
        text-color:                  inherit;
        highlight:                   inherit;
        cursor:                      inherit;
        vertical-align:              0.5;
        horizontal-align:            0.5;
    }
    error-message {
        padding:                     100px;
        border:                      0px solid;
        border-radius:               0px;
        border-color:                @selected;
        background-color:            black / 10%;
        text-color:                  @foreground;
    }
    textbox {
        background-color:            transparent;
        text-color:                  @foreground;
        vertical-align:              0.5;
        horizontal-align:            0.0;
        highlight:                   none;
    }
  '';

  i3config = builtins.toFile "config" ''
    set $mod                             Mod4
    set $smod                            Shift
    set $wm_setting_font                 pango:Source Sans Pro, Semibold 11
    set $wm_setting_gap_width            15
    set $wm_setting_gap_heigth           15
    set $wm_setting_border_size          2
    set $wm_setting_key_left             Left
    set $wm_setting_key_down             Down
    set $wm_setting_key_up               Up
    set $wm_setting_key_right            Right
    set $wm_setting_app_terminal         kitty
    set $wm_setting_app_browser          firefox
    set $wm_setting_app_launcher         rofi
    set $wm_setting_app_compositor       picom
    set $wm_color_border_active_bg       #81A1C1
    set $wm_color_border_active_fg       #3B4252
    set $wm_color_border_inactive_bg     #3B4252
    set $wm_color_border_inactive_fg     #D8DEE9
    set $wm_color_background             #2E3440
    set $bar_setting_position            bottom
    set $bar_setting_mode                dock
    set $bar_setting_font                pango:Source Sans Pro, Semibold 11
    set $bar_setting_separator           " - "
    set $bar_setting_statusCommand       i3status
    set $bar_setting_trayoutput          full
    set $bar_color_background            #3B4252
    set $bar_color_foreground            #D8DEE9
    set $bar_color_statusline            #D8DEE9
    set $bar_color_separator             #D8DEE9
    set $bar_color_workspace_focused_bg  #A3BE8C
    set $bar_color_workspace_focused_fg  #2E3440
    set $bar_color_workspace_active_bg   #EBCB8B
    set $bar_color_workspace_active_fg   #2E3440
    set $bar_color_workspace_inactive_bg #BF616A
    set $bar_color_workspace_inactive_fg #2E3440
    set $bar_color_workspace_urgent_bg   #D08770
    set $bar_color_workspace_urgent_fg   #2E3440
    ### Applications ###
    # Start a terminal emulator
    bindsym $mod+l exec $wm_setting_app_terminal
    # Start a web browser
    bindsym $mod+b exec $wm_setting_app_browser
    # Start a program launcher
    bindsym $mod+t exec $wm_setting_app_launcher
    # Run a window compositor (for effects like transparency or full VSync)
    exec_always --no-startup-id $wm_setting_app_compositor
    ### Workspaces ###
    # Define names for default workspaces for which we configure key bindings later on.
    # We use variables to avoid repeating the names in multiple places.
    set $ws1  "    1    "
    set $ws2  "    2    "
    set $ws3  "    3    "
    set $ws4  "    4    "
    set $ws5  "    5    "
    set $ws6  "    6    "
    set $ws7  "    7    "
    set $ws8  "    8    "
    set $ws9  "    9    "
    set $ws10 "    10    "
    # Switch to workspace n
    bindsym $mod+1 workspace $ws1
    bindsym $mod+2 workspace $ws2
    bindsym $mod+3 workspace $ws3
    bindsym $mod+4 workspace $ws4
    bindsym $mod+5 workspace $ws5
    bindsym $mod+6 workspace $ws6
    bindsym $mod+7 workspace $ws7
    bindsym $mod+8 workspace $ws8
    bindsym $mod+9 workspace $ws9
    bindsym $mod+0 workspace $ws10
    # Move focused container to workspace n
    bindsym $mod+$smod+1 move container to workspace $ws1
    bindsym $mod+$smod+2 move container to workspace $ws2
    bindsym $mod+$smod+3 move container to workspace $ws3
    bindsym $mod+$smod+4 move container to workspace $ws4
    bindsym $mod+$smod+5 move container to workspace $ws5
    bindsym $mod+$smod+6 move container to workspace $ws6
    bindsym $mod+$smod+7 move container to workspace $ws7
    bindsym $mod+$smod+8 move container to workspace $ws8
    bindsym $mod+$smod+9 move container to workspace $ws9
    bindsym $mod+$smod+0 move container to workspace $ws10
    ### Window sizes and positions ###
    # Cange focus
    bindsym $mod+$wm_setting_key_left        focus left
    bindsym $mod+$wm_setting_key_down        focus down
    bindsym $mod+$wm_setting_key_up          focus up
    bindsym $mod+$wm_setting_key_right       focus right
    # Move focused window
    bindsym $mod+$smod+$wm_setting_key_left  move left
    bindsym $mod+$smod+$wm_setting_key_down  move down
    bindsym $mod+$smod+$wm_setting_key_up    move up
    bindsym $mod+$smod+$wm_setting_key_right move right
    # Resize window (you can also use the mouse for that)
    mode "resize" {
    #	These bindings trigger as soon as you enter the resize mode
    #	Pressing left will shrink the window’s width.
    #	Pressing right will grow the window’s width.
    #	Pressing up will shrink the window’s height.
    #	Pressing down will grow the window’s height.
    	bindsym $wm_setting_key_left  resize shrink width 10 px or 10 ppt
    	bindsym $wm_setting_key_down  resize grow height 10 px or 10 ppt
    	bindsym $wm_setting_key_up    resize shrink height 10 px or 10 ppt
    	bindsym $wm_setting_key_right resize grow width 10 px or 10 ppt
    #	Resize the gap width and height
    	bindsym $smod+$wm_setting_key_left  gaps horizontal minus 5
    	bindsym $smod+$wm_setting_key_down  gaps horizontal plus 5
    	bindsym $smod+$wm_setting_key_up    gaps vertical minus 5
    	bindsym $smod+$wm_setting_key_right gaps vertical plus 5
    #	Back to normal: Enter or Escape or $mod+r
    	bindsym Return mode "default"
    	bindsym Escape mode "default"
    	bindsym $mod+r mode "default"
    }
    bindsym $mod+r mode "resize"
    ### Gaps ###
    gaps horizontal $wm_setting_gap_width
    gaps vertical   $wm_setting_gap_heigth
    smart_gaps on
    ### Borders ###
    default_border pixel $wm_setting_border_size
    default_floating_border pixel $wm_setting_border_size
    smart_borders on
    ### Colors ###
    # class                 border                       background                   text                         indicator                    child_border
    client.focused          $wm_color_border_active_bg   $wm_color_border_active_bg   $wm_color_border_active_fg   $wm_color_border_active_bg   $wm_color_border_active_bg
    client.focused_inactive $wm_color_border_inactive_bg $wm_color_border_inactive_bg $wm_color_border_inactive_fg $wm_color_border_inactive_bg $wm_color_border_inactive_bg
    client.unfocused        $wm_color_border_inactive_bg $wm_color_border_inactive_bg $wm_color_border_inactive_fg $wm_color_border_inactive_bg $wm_color_border_inactive_bg
    client.urgent           $wm_color_border_inactive_bg $wm_color_border_inactive_bg $wm_color_border_inactive_fg $wm_color_border_inactive_bg $wm_color_border_inactive_bg
    client.placeholder      $wm_color_border_inactive_bg $wm_color_border_inactive_bg $wm_color_border_inactive_fg $wm_color_border_inactive_bg $wm_color_border_inactive_bg
    client.background       $wm_color_background
    ### Miscellaneous settings ###
    # Set the font used for titlebars (which are hidden here)
    font $wm_setting_font
    # Use Mouse+$mod to drag floating windows to their wanted position
    floating_modifier $mod
    # Enter fullscreen mode for the focused window
    bindsym $mod+f fullscreen toggle
    # Toggle between tiling and floating
    bindsym $mod+$smod+f floating toggle
    # Kill the focused window
    bindsym $mod+q kill
    # Restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
    bindsym $mod+$smod+r restart
    # Exit i3 (logs you out of your X session)
    bindsym $mod+$smod+y exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"
  '';

  waybarstylecss = builtins.toFile "style.css" ''
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

  flavortoml = builtins.toFile "flavor.toml" ''
    [manager]
    cwd = { fg = "#81c8be" }
    hovered         = { reversed = true }
    preview_hovered = { underline = true }
    find_keyword  = { fg = "#e5c890", bold = true, italic = true, underline = true }
    find_position = { fg = "#f4b8e4", bg = "reset", bold = true, italic = true }
    marker_copied   = { fg = "#a6d189", bg = "#a6d189" }
    marker_cut      = { fg = "#e78284", bg = "#e78284" }
    marker_marked   = { fg = "#81c8be", bg = "#81c8be" }
    marker_selected = { fg = "#e5c890", bg = "#e5c890" }
    tab_active   = { reversed = true }
    tab_inactive = {}
    tab_width    = 1
    count_copied   = { fg = "#303446", bg = "#a6d189" }
    count_cut      = { fg = "#303446", bg = "#e78284" }
    count_selected = { fg = "#303446", bg = "#e5c890" }
    border_symbol = "│"
    border_style  = { fg = "#838ba7" }
    [status]
    separator_open  = ""
    separator_close = ""
    separator_style = { fg = "#51576d", bg = "#51576d" }
    mode_normal = { fg = "#303446", bg = "#8caaee", bold = true }
    mode_select = { fg = "#303446", bg = "#a6d189", bold = true }
    mode_unset  = { fg = "#303446", bg = "#eebebe", bold = true }
    progress_label  = { fg = "#ffffff", bold = true }
    progress_normal = { fg = "#8caaee", bg = "#51576d" }
    progress_error  = { fg = "#e78284", bg = "#51576d" }
    permissions_t = { fg = "#8caaee" }
    permissions_r = { fg = "#e5c890" }
    permissions_w = { fg = "#e78284" }
    permissions_x = { fg = "#a6d189" }
    permissions_s = { fg = "#838ba7" }
    [select]
    border   = { fg = "#8caaee" }
    active   = { fg = "#f4b8e4", bold = true }
    inactive = {}
    [input]
    border   = { fg = "#8caaee" }
    title    = {}
    value    = {}
    selected = { reversed = true }
    [completion]
    border = { fg = "#8caaee" }
    [tasks]
    border  = { fg = "#8caaee" }
    title   = {}
    hovered = { fg = "#f4b8e4", underline = true }
    [which]
    mask            = { bg = "#414559" }
    cand            = { fg = "#81c8be" }
    rest            = { fg = "#949cbb" }
    desc            = { fg = "#f4b8e4" }
    separator       = "  "
    separator_style = { fg = "#626880" }
    [help]
    on      = { fg = "#81c8be" }
    run     = { fg = "#f4b8e4" }
    hovered = { reversed = true, bold = true }
    footer  = { fg = "#51576d", bg = "#c6d0f5" }
    [notify]
    title_info  = { fg = "#a6d189" }
    title_warn  = { fg = "#e5c890" }
    title_error = { fg = "#e78284" }
    [filetype]
    rules = [
    	{ mime = "image/*", fg = "#81c8be" },
    	{ mime = "{audio,video}/*", fg = "#e5c890" },
    	{ mime = "application/*zip", fg = "#f4b8e4" },
    	{ mime = "application/x-{tar,bzip*,7z-compressed,xz,rar}", fg = "#f4b8e4" },
    	{ mime = "application/{pdf,doc,rtf,vnd.*}", fg = "#a6d189" },
    	{ name = "*", fg = "#c6d0f5" },
    	{ name = "*/", fg = "#8caaee" }
    ]
  '';

  tmthemexml = builtins.toFile "tmtheme.xml" ''
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>name</key>
        <string>Catppuccin Frappé</string>
        <key>semanticClass</key>
        <string>theme.dark.catppuccin-frappé</string>
        <key>uuid</key>
        <string>e0ada983-8938-490c-86f0-97a1a0ec58e4</string>
        <key>author</key>
        <string>Catppuccin Org</string>
        <key>colorSpaceName</key>
        <string>sRGB</string>
        <key>settings</key>
        <array>
          <dict>
            <key>settings</key>
            <dict>
              <key>background</key>
              <string>#303446</string>
              <key>foreground</key>
              <string>#c6d0f5</string>
              <key>caret</key>
              <string>#f2d5cf</string>
              <key>lineHighlight</key>
              <string>#c6d0f512</string>
              <key>misspelling</key>
              <string>#e78284</string>
              <key>accent</key>
              <string>#ca9ee6</string>
              <key>selection</key>
              <string>#949cbb40</string>
              <key>activeGuide</key>
              <string>#51576d</string>
              <key>findHighlight</key>
              <string>#506373</string>
              <key>gutterForeground</key>
              <string>#838ba7</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Basic text &amp; variable names (incl. leading punctuation)</string>
            <key>scope</key>
            <string>text, source, variable.other.readwrite, punctuation.definition.variable</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#c6d0f5</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Parentheses, Brackets, Braces</string>
            <key>scope</key>
            <string>punctuation</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#949cbb</string>
              <key>fontStyle</key>
              <string/>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Comments</string>
            <key>scope</key>
            <string>comment, punctuation.definition.comment</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#737994</string>
              <key>fontStyle</key>
              <string>italic</string>
            </dict>
          </dict>
          <dict>
            <key>scope</key>
            <string>string, punctuation.definition.string</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#a6d189</string>
            </dict>
          </dict>
          <dict>
            <key>scope</key>
            <string>constant.character.escape</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#f4b8e4</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Booleans, constants, numbers</string>
            <key>scope</key>
            <string>constant.numeric, variable.other.constant, entity.name.constant, constant.language.boolean, constant.language.false, constant.language.true, keyword.other.unit.user-defined, keyword.other.unit.suffix.floating-point</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ef9f76</string>
            </dict>
          </dict>
          <dict>
            <key>scope</key>
            <string>keyword, keyword.operator.word, keyword.operator.new, variable.language.super, support.type.primitive, storage.type, storage.modifier, punctuation.definition.keyword</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ca9ee6</string>
              <key>fontStyle</key>
              <string/>
            </dict>
          </dict>
          <dict>
            <key>scope</key>
            <string>entity.name.tag.documentation</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ca9ee6</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Punctuation</string>
            <key>scope</key>
            <string>keyword.operator, punctuation.accessor, punctuation.definition.generic, meta.function.closure punctuation.section.parameters, punctuation.definition.tag, punctuation.separator.key-value</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#81c8be</string>
            </dict>
          </dict>
          <dict>
            <key>scope</key>
            <string>entity.name.function, meta.function-call.method, support.function, support.function.misc, variable.function</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#8caaee</string>
              <key>fontStyle</key>
              <string>italic</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Classes</string>
            <key>scope</key>
            <string>entity.name.class, entity.other.inherited-class, support.class, meta.function-call.constructor, entity.name.struct</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e5c890</string>
              <key>fontStyle</key>
              <string>italic</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Enum</string>
            <key>scope</key>
            <string>entity.name.enum</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e5c890</string>
              <key>fontStyle</key>
              <string>italic</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Enum member</string>
            <key>scope</key>
            <string>meta.enum variable.other.readwrite, variable.other.enummember</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#81c8be</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Object properties</string>
            <key>scope</key>
            <string>meta.property.object</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#81c8be</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Types</string>
            <key>scope</key>
            <string>meta.type, meta.type-alias, support.type, entity.name.type</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e5c890</string>
              <key>fontStyle</key>
              <string>italic</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Decorators</string>
            <key>scope</key>
            <string>meta.annotation variable.function, meta.annotation variable.annotation.function, meta.annotation punctuation.definition.annotation, meta.decorator, punctuation.decorator</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ef9f76</string>
            </dict>
          </dict>
          <dict>
            <key>scope</key>
            <string>variable.parameter, meta.function.parameters</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ea999c</string>
              <key>fontStyle</key>
              <string>italic</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Built-ins</string>
            <key>scope</key>
            <string>constant.language, support.function.builtin</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e78284</string>
            </dict>
          </dict>
          <dict>
            <key>scope</key>
            <string>entity.other.attribute-name.documentation</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e78284</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Preprocessor directives</string>
            <key>scope</key>
            <string>keyword.control.directive, punctuation.definition.directive</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e5c890</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Type parameters</string>
            <key>scope</key>
            <string>punctuation.definition.typeparameters</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#99d1db</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Namespaces</string>
            <key>scope</key>
            <string>entity.name.namespace</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e5c890</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Property names (left hand assignments in json/yaml/css)</string>
            <key>scope</key>
            <string>support.type.property-name.css</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#8caaee</string>
              <key>fontStyle</key>
              <string/>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>This/Self keyword</string>
            <key>scope</key>
            <string>variable.language.this, variable.language.this punctuation.definition.variable</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e78284</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Object properties</string>
            <key>scope</key>
            <string>variable.object.property</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#c6d0f5</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>String template interpolation</string>
            <key>scope</key>
            <string>string.template variable, string variable</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#c6d0f5</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>`new` as bold</string>
            <key>scope</key>
            <string>keyword.operator.new</string>
            <key>settings</key>
            <dict>
              <key>fontStyle</key>
              <string>bold</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>C++ extern keyword</string>
            <key>scope</key>
            <string>storage.modifier.specifier.extern.cpp</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ca9ee6</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>C++ scope resolution</string>
            <key>scope</key>
            <string>entity.name.scope-resolution.template.call.cpp, entity.name.scope-resolution.parameter.cpp, entity.name.scope-resolution.cpp, entity.name.scope-resolution.function.definition.cpp</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e5c890</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>C++ doc keywords</string>
            <key>scope</key>
            <string>storage.type.class.doxygen</string>
            <key>settings</key>
            <dict>
              <key>fontStyle</key>
              <string/>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>C++ operators</string>
            <key>scope</key>
            <string>storage.modifier.reference.cpp</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#81c8be</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>C# Interpolated Strings</string>
            <key>scope</key>
            <string>meta.interpolation.cs</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#c6d0f5</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>C# xml-style docs</string>
            <key>scope</key>
            <string>comment.block.documentation.cs</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#c6d0f5</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Classes, reflecting the className color in JSX</string>
            <key>scope</key>
            <string>source.css entity.other.attribute-name.class.css, entity.other.attribute-name.parent-selector.css punctuation.definition.entity.css</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e5c890</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Operators</string>
            <key>scope</key>
            <string>punctuation.separator.operator.css</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#81c8be</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Pseudo classes</string>
            <key>scope</key>
            <string>source.css entity.other.attribute-name.pseudo-class</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#81c8be</string>
            </dict>
          </dict>
          <dict>
            <key>scope</key>
            <string>source.css constant.other.unicode-range</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ef9f76</string>
            </dict>
          </dict>
          <dict>
            <key>scope</key>
            <string>source.css variable.parameter.url</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#a6d189</string>
              <key>fontStyle</key>
              <string/>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>CSS vendored property names</string>
            <key>scope</key>
            <string>support.type.vendored.property-name</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#99d1db</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Less/SCSS right-hand variables (@/$-prefixed)</string>
            <key>scope</key>
            <string>source.css meta.property-value variable, source.css meta.property-value variable.other.less, source.css meta.property-value variable.other.less punctuation.definition.variable.less, meta.definition.variable.scss</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ea999c</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>CSS variables (--prefixed)</string>
            <key>scope</key>
            <string>source.css meta.property-list variable, meta.property-list variable.other.less, meta.property-list variable.other.less punctuation.definition.variable.less</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#8caaee</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>CSS Percentage values, styled the same as numbers</string>
            <key>scope</key>
            <string>keyword.other.unit.percentage.css</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ef9f76</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>CSS Attribute selectors, styled the same as strings</string>
            <key>scope</key>
            <string>source.css meta.attribute-selector</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#a6d189</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>JSON/YAML keys, other left-hand assignments</string>
            <key>scope</key>
            <string>keyword.other.definition.ini, punctuation.support.type.property-name.json, support.type.property-name.json, punctuation.support.type.property-name.toml, support.type.property-name.toml, entity.name.tag.yaml, punctuation.support.type.property-name.yaml, support.type.property-name.yaml</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#8caaee</string>
              <key>fontStyle</key>
              <string/>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>JSON/YAML constants</string>
            <key>scope</key>
            <string>constant.language.json, constant.language.yaml</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ef9f76</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>YAML anchors</string>
            <key>scope</key>
            <string>entity.name.type.anchor.yaml, variable.other.alias.yaml</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e5c890</string>
              <key>fontStyle</key>
              <string/>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>TOML tables / ini groups</string>
            <key>scope</key>
            <string>support.type.property-name.table, entity.name.section.group-title.ini</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e5c890</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>TOML dates</string>
            <key>scope</key>
            <string>constant.other.time.datetime.offset.toml</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#f4b8e4</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>YAML anchor puctuation</string>
            <key>scope</key>
            <string>punctuation.definition.anchor.yaml, punctuation.definition.alias.yaml</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#f4b8e4</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>YAML triple dashes</string>
            <key>scope</key>
            <string>entity.other.document.begin.yaml</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#f4b8e4</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Markup Diff</string>
            <key>scope</key>
            <string>markup.changed.diff</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ef9f76</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Diff</string>
            <key>scope</key>
            <string>meta.diff.header.from-file, meta.diff.header.to-file, punctuation.definition.from-file.diff, punctuation.definition.to-file.diff</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#8caaee</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Diff Inserted</string>
            <key>scope</key>
            <string>markup.inserted.diff</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#a6d189</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Diff Deleted</string>
            <key>scope</key>
            <string>markup.deleted.diff</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e78284</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>dotenv left-hand side assignments</string>
            <key>scope</key>
            <string>variable.other.env</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#8caaee</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>dotenv reference to existing env variable</string>
            <key>scope</key>
            <string>string.quoted variable.other.env</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#c6d0f5</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>GDScript functions</string>
            <key>scope</key>
            <string>support.function.builtin.gdscript</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#8caaee</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>GDScript constants</string>
            <key>scope</key>
            <string>constant.language.gdscript</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ef9f76</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Comment keywords</string>
            <key>scope</key>
            <string>comment meta.annotation.go</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ea999c</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>go:embed, go:build, etc.</string>
            <key>scope</key>
            <string>comment meta.annotation.parameters.go</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ef9f76</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Go constants (nil, true, false)</string>
            <key>scope</key>
            <string>constant.language.go</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ef9f76</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>GraphQL variables</string>
            <key>scope</key>
            <string>variable.graphql</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#c6d0f5</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>GraphQL aliases</string>
            <key>scope</key>
            <string>string.unquoted.alias.graphql</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#eebebe</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>GraphQL enum members</string>
            <key>scope</key>
            <string>constant.character.enum.graphql</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#81c8be</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>GraphQL field in types</string>
            <key>scope</key>
            <string>meta.objectvalues.graphql constant.object.key.graphql string.unquoted.graphql</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#eebebe</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>HTML/XML DOCTYPE as keyword</string>
            <key>scope</key>
            <string>keyword.other.doctype, meta.tag.sgml.doctype punctuation.definition.tag, meta.tag.metadata.doctype entity.name.tag, meta.tag.metadata.doctype punctuation.definition.tag</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ca9ee6</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>HTML/XML-like &lt;tags/&gt;</string>
            <key>scope</key>
            <string>entity.name.tag</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#8caaee</string>
              <key>fontStyle</key>
              <string/>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Special characters like &amp;amp;</string>
            <key>scope</key>
            <string>text.html constant.character.entity, text.html constant.character.entity punctuation, constant.character.entity.xml, constant.character.entity.xml punctuation, constant.character.entity.js.jsx, constant.charactger.entity.js.jsx punctuation, constant.character.entity.tsx, constant.character.entity.tsx punctuation</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e78284</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>HTML/XML tag attribute values</string>
            <key>scope</key>
            <string>entity.other.attribute-name</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e5c890</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Components</string>
            <key>scope</key>
            <string>support.class.component, support.class.component.jsx, support.class.component.tsx, support.class.component.vue</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#f4b8e4</string>
              <key>fontStyle</key>
              <string/>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Annotations</string>
            <key>scope</key>
            <string>punctuation.definition.annotation, storage.type.annotation</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ef9f76</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Java enums</string>
            <key>scope</key>
            <string>constant.other.enum.java</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#81c8be</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Java imports</string>
            <key>scope</key>
            <string>storage.modifier.import.java</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#c6d0f5</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Javadoc</string>
            <key>scope</key>
            <string>comment.block.javadoc.java keyword.other.documentation.javadoc.java</string>
            <key>settings</key>
            <dict>
              <key>fontStyle</key>
              <string/>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Exported Variable</string>
            <key>scope</key>
            <string>meta.export variable.other.readwrite.js</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ea999c</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>JS/TS constants &amp; properties</string>
            <key>scope</key>
            <string>variable.other.constant.js, variable.other.constant.ts, variable.other.property.js, variable.other.property.ts</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#c6d0f5</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>JSDoc; these are mainly params, so styled as such</string>
            <key>scope</key>
            <string>variable.other.jsdoc, comment.block.documentation variable.other</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ea999c</string>
              <key>fontStyle</key>
              <string/>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>JSDoc keywords</string>
            <key>scope</key>
            <string>storage.type.class.jsdoc</string>
            <key>settings</key>
            <dict>
              <key>fontStyle</key>
              <string/>
            </dict>
          </dict>
          <dict>
            <key>scope</key>
            <string>support.type.object.console.js</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#c6d0f5</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Node constants as keywords (module, etc.)</string>
            <key>scope</key>
            <string>support.constant.node, support.type.object.module.js</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ca9ee6</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>implements as keyword</string>
            <key>scope</key>
            <string>storage.modifier.implements</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ca9ee6</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Builtin types</string>
            <key>scope</key>
            <string>constant.language.null.js, constant.language.null.ts, constant.language.undefined.js, constant.language.undefined.ts, support.type.builtin.ts</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ca9ee6</string>
            </dict>
          </dict>
          <dict>
            <key>scope</key>
            <string>variable.parameter.generic</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e5c890</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Arrow functions</string>
            <key>scope</key>
            <string>keyword.declaration.function.arrow.js, storage.type.function.arrow.ts</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#81c8be</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Decorator punctuations (decorators inherit from blue functions, instead of styleguide peach)</string>
            <key>scope</key>
            <string>punctuation.decorator.ts</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#8caaee</string>
              <key>fontStyle</key>
              <string>italic</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Extra JS/TS keywords</string>
            <key>scope</key>
            <string>keyword.operator.expression.in.js, keyword.operator.expression.in.ts, keyword.operator.expression.infer.ts, keyword.operator.expression.instanceof.js, keyword.operator.expression.instanceof.ts, keyword.operator.expression.is, keyword.operator.expression.keyof.ts, keyword.operator.expression.of.js, keyword.operator.expression.of.ts, keyword.operator.expression.typeof.ts</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ca9ee6</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Julia macros</string>
            <key>scope</key>
            <string>support.function.macro.julia</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#81c8be</string>
              <key>fontStyle</key>
              <string>italic</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Julia language constants (true, false)</string>
            <key>scope</key>
            <string>constant.language.julia</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ef9f76</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Julia other constants (these seem to be arguments inside arrays)</string>
            <key>scope</key>
            <string>constant.other.symbol.julia</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ea999c</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>LaTeX preamble</string>
            <key>scope</key>
            <string>text.tex keyword.control.preamble</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#81c8be</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>LaTeX be functions</string>
            <key>scope</key>
            <string>text.tex support.function.be</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#99d1db</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>LaTeX math</string>
            <key>scope</key>
            <string>constant.other.general.math.tex</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#eebebe</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Lua docstring keywords</string>
            <key>scope</key>
            <string>comment.line.double-dash.documentation.lua storage.type.annotation.lua</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ca9ee6</string>
              <key>fontStyle</key>
              <string/>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Lua docstring variables</string>
            <key>scope</key>
            <string>comment.line.double-dash.documentation.lua entity.name.variable.lua, comment.line.double-dash.documentation.lua variable.lua</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#c6d0f5</string>
            </dict>
          </dict>
          <dict>
            <key>scope</key>
            <string>heading.1.markdown punctuation.definition.heading.markdown, heading.1.markdown, markup.heading.atx.1.mdx, markup.heading.atx.1.mdx punctuation.definition.heading.mdx, markup.heading.setext.1.markdown, markup.heading.heading-0.asciidoc</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e78284</string>
            </dict>
          </dict>
          <dict>
            <key>scope</key>
            <string>heading.2.markdown punctuation.definition.heading.markdown, heading.2.markdown, markup.heading.atx.2.mdx, markup.heading.atx.2.mdx punctuation.definition.heading.mdx, markup.heading.setext.2.markdown, markup.heading.heading-1.asciidoc</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ef9f76</string>
            </dict>
          </dict>
          <dict>
            <key>scope</key>
            <string>heading.3.markdown punctuation.definition.heading.markdown, heading.3.markdown, markup.heading.atx.3.mdx, markup.heading.atx.3.mdx punctuation.definition.heading.mdx, markup.heading.heading-2.asciidoc</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e5c890</string>
            </dict>
          </dict>
          <dict>
            <key>scope</key>
            <string>heading.4.markdown punctuation.definition.heading.markdown, heading.4.markdown, markup.heading.atx.4.mdx, markup.heading.atx.4.mdx punctuation.definition.heading.mdx, markup.heading.heading-3.asciidoc</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#a6d189</string>
            </dict>
          </dict>
          <dict>
            <key>scope</key>
            <string>heading.5.markdown punctuation.definition.heading.markdown, heading.5.markdown, markup.heading.atx.5.mdx, markup.heading.atx.5.mdx punctuation.definition.heading.mdx, markup.heading.heading-4.asciidoc</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#8caaee</string>
            </dict>
          </dict>
          <dict>
            <key>scope</key>
            <string>heading.6.markdown punctuation.definition.heading.markdown, heading.6.markdown, markup.heading.atx.6.mdx, markup.heading.atx.6.mdx punctuation.definition.heading.mdx, markup.heading.heading-5.asciidoc</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ca9ee6</string>
            </dict>
          </dict>
          <dict>
            <key>scope</key>
            <string>markup.bold</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e78284</string>
              <key>fontStyle</key>
              <string>bold</string>
            </dict>
          </dict>
          <dict>
            <key>scope</key>
            <string>markup.italic</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e78284</string>
              <key>fontStyle</key>
              <string>italic</string>
            </dict>
          </dict>
          <dict>
            <key>scope</key>
            <string>markup.strikethrough</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#a5adce</string>
              <key>fontStyle</key>
              <string>strikethrough</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Markdown auto links</string>
            <key>scope</key>
            <string>punctuation.definition.link, markup.underline.link</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#8caaee</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Markdown links</string>
            <key>scope</key>
            <string>text.html.markdown punctuation.definition.link.title, string.other.link.title.markdown, markup.link, punctuation.definition.constant.markdown, constant.other.reference.link.markdown, markup.substitution.attribute-reference</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#babbf1</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Markdown code spans</string>
            <key>scope</key>
            <string>punctuation.definition.raw.markdown, markup.inline.raw.string.markdown, markup.raw.block.markdown</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#a6d189</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Markdown triple backtick language identifier</string>
            <key>scope</key>
            <string>fenced_code.block.language</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#99d1db</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Markdown triple backticks</string>
            <key>scope</key>
            <string>markup.fenced_code.block punctuation.definition, markup.raw support.asciidoc</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#949cbb</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Markdown quotes</string>
            <key>scope</key>
            <string>markup.quote, punctuation.definition.quote.begin</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#f4b8e4</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Markdown separators</string>
            <key>scope</key>
            <string>meta.separator.markdown</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#81c8be</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Markdown list bullets</string>
            <key>scope</key>
            <string>punctuation.definition.list.begin.markdown, markup.list.bullet</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#81c8be</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Nix attribute names</string>
            <key>scope</key>
            <string>entity.other.attribute-name.multipart.nix, entity.other.attribute-name.single.nix</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#8caaee</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Nix parameter names</string>
            <key>scope</key>
            <string>variable.parameter.name.nix</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#c6d0f5</string>
              <key>fontStyle</key>
              <string/>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Nix interpolated parameter names</string>
            <key>scope</key>
            <string>meta.embedded variable.parameter.name.nix</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#babbf1</string>
              <key>fontStyle</key>
              <string/>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Nix paths</string>
            <key>scope</key>
            <string>string.unquoted.path.nix</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#f4b8e4</string>
              <key>fontStyle</key>
              <string/>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>PHP Attributes</string>
            <key>scope</key>
            <string>support.attribute.builtin, meta.attribute.php</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e5c890</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>PHP Parameters (needed for the leading dollar sign)</string>
            <key>scope</key>
            <string>meta.function.parameters.php punctuation.definition.variable.php</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ea999c</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>PHP Constants (null, __FILE__, etc.)</string>
            <key>scope</key>
            <string>constant.language.php</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ca9ee6</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>PHP functions</string>
            <key>scope</key>
            <string>text.html.php support.function</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#99d1db</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>PHPdoc keywords</string>
            <key>scope</key>
            <string>keyword.other.phpdoc.php</string>
            <key>settings</key>
            <dict>
              <key>fontStyle</key>
              <string/>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Python argument functions reset to text, otherwise they inherit blue from function-call</string>
            <key>scope</key>
            <string>support.variable.magic.python, meta.function-call.arguments.python</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#c6d0f5</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Python double underscore functions</string>
            <key>scope</key>
            <string>support.function.magic.python</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#99d1db</string>
              <key>fontStyle</key>
              <string>italic</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Python `self` keyword</string>
            <key>scope</key>
            <string>variable.parameter.function.language.special.self.python, variable.language.special.self.python</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e78284</string>
              <key>fontStyle</key>
              <string>italic</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>python keyword flow/logical (for ... in)</string>
            <key>scope</key>
            <string>keyword.control.flow.python, keyword.operator.logical.python</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ca9ee6</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>python storage type</string>
            <key>scope</key>
            <string>storage.type.function.python</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ca9ee6</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>python function support</string>
            <key>scope</key>
            <string>support.token.decorator.python, meta.function.decorator.identifier.python</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#99d1db</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>python function calls</string>
            <key>scope</key>
            <string>meta.function-call.python</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#8caaee</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>python function decorators</string>
            <key>scope</key>
            <string>entity.name.function.decorator.python, punctuation.definition.decorator.python</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ef9f76</string>
              <key>fontStyle</key>
              <string>italic</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>python placeholder reset to normal string</string>
            <key>scope</key>
            <string>constant.character.format.placeholder.other.python</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#f4b8e4</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Python exception &amp; builtins such as exit()</string>
            <key>scope</key>
            <string>support.type.exception.python, support.function.builtin.python</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ef9f76</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>entity.name.type</string>
            <key>scope</key>
            <string>support.type.python</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ef9f76</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>python constants (True/False)</string>
            <key>scope</key>
            <string>constant.language.python</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ca9ee6</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Arguments accessed later in the function body</string>
            <key>scope</key>
            <string>meta.indexed-name.python, meta.item-access.python</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ea999c</string>
              <key>fontStyle</key>
              <string>italic</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Python f-strings/binary/unicode storage types</string>
            <key>scope</key>
            <string>storage.type.string.python</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#a6d189</string>
              <key>fontStyle</key>
              <string>italic</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Python type hints</string>
            <key>scope</key>
            <string>meta.function.parameters.python</string>
            <key>settings</key>
            <dict>
              <key>fontStyle</key>
              <string/>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Regex string begin/end in JS/TS</string>
            <key>scope</key>
            <string>string.regexp punctuation.definition.string.begin, string.regexp punctuation.definition.string.end</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#f4b8e4</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Regex anchors (^, $)</string>
            <key>scope</key>
            <string>keyword.control.anchor.regexp</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ca9ee6</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Regex regular string match</string>
            <key>scope</key>
            <string>string.regexp.ts</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#c6d0f5</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Regex group parenthesis &amp; backreference (\1, \2, \3, ...)</string>
            <key>scope</key>
            <string>punctuation.definition.group.regexp, keyword.other.back-reference.regexp</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#a6d189</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Regex character class []</string>
            <key>scope</key>
            <string>punctuation.definition.character-class.regexp</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e5c890</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Regex character classes (\d, \w, \s)</string>
            <key>scope</key>
            <string>constant.other.character-class.regexp</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#f4b8e4</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Regex range</string>
            <key>scope</key>
            <string>constant.other.character-class.range.regexp</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#f2d5cf</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Regex quantifier</string>
            <key>scope</key>
            <string>keyword.operator.quantifier.regexp</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#81c8be</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Regex constant/numeric</string>
            <key>scope</key>
            <string>constant.character.numeric.regexp</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ef9f76</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Regex lookaheads, negative lookaheads, lookbehinds, negative lookbehinds</string>
            <key>scope</key>
            <string>punctuation.definition.group.no-capture.regexp, meta.assertion.look-ahead.regexp, meta.assertion.negative-look-ahead.regexp</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#8caaee</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Rust attribute</string>
            <key>scope</key>
            <string>meta.annotation.rust, meta.annotation.rust punctuation, meta.attribute.rust, punctuation.definition.attribute.rust</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e5c890</string>
              <key>fontStyle</key>
              <string>italic</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Rust attribute strings</string>
            <key>scope</key>
            <string>meta.attribute.rust string.quoted.double.rust, meta.attribute.rust string.quoted.single.char.rust</string>
            <key>settings</key>
            <dict>
              <key>fontStyle</key>
              <string/>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Rust keyword</string>
            <key>scope</key>
            <string>entity.name.function.macro.rules.rust, storage.type.module.rust, storage.modifier.rust, storage.type.struct.rust, storage.type.enum.rust, storage.type.trait.rust, storage.type.union.rust, storage.type.impl.rust, storage.type.rust, storage.type.function.rust, storage.type.type.rust</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ca9ee6</string>
              <key>fontStyle</key>
              <string/>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Rust u/i32, u/i64, etc.</string>
            <key>scope</key>
            <string>entity.name.type.numeric.rust</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ca9ee6</string>
              <key>fontStyle</key>
              <string/>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Rust generic</string>
            <key>scope</key>
            <string>meta.generic.rust</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ef9f76</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Rust impl</string>
            <key>scope</key>
            <string>entity.name.impl.rust</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e5c890</string>
              <key>fontStyle</key>
              <string>italic</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Rust module</string>
            <key>scope</key>
            <string>entity.name.module.rust</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ef9f76</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Rust trait</string>
            <key>scope</key>
            <string>entity.name.trait.rust</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e5c890</string>
              <key>fontStyle</key>
              <string>italic</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Rust struct</string>
            <key>scope</key>
            <string>storage.type.source.rust</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e5c890</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Rust union</string>
            <key>scope</key>
            <string>entity.name.union.rust</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e5c890</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Rust enum member</string>
            <key>scope</key>
            <string>meta.enum.rust storage.type.source.rust</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#81c8be</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Rust macro</string>
            <key>scope</key>
            <string>support.macro.rust, meta.macro.rust support.function.rust, entity.name.function.macro.rust</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#8caaee</string>
              <key>fontStyle</key>
              <string>italic</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Rust lifetime</string>
            <key>scope</key>
            <string>storage.modifier.lifetime.rust, entity.name.type.lifetime</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#8caaee</string>
              <key>fontStyle</key>
              <string>italic</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Rust string formatting</string>
            <key>scope</key>
            <string>string.quoted.double.rust constant.other.placeholder.rust</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#f4b8e4</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Rust return type generic</string>
            <key>scope</key>
            <string>meta.function.return-type.rust meta.generic.rust storage.type.rust</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#c6d0f5</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Rust functions</string>
            <key>scope</key>
            <string>meta.function.call.rust</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#8caaee</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Rust angle brackets</string>
            <key>scope</key>
            <string>punctuation.brackets.angle.rust</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#99d1db</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Rust constants</string>
            <key>scope</key>
            <string>constant.other.caps.rust</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ef9f76</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Rust function parameters</string>
            <key>scope</key>
            <string>meta.function.definition.rust variable.other.rust</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ea999c</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Rust closure variables</string>
            <key>scope</key>
            <string>meta.function.call.rust variable.other.rust</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#c6d0f5</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Rust self</string>
            <key>scope</key>
            <string>variable.language.self.rust</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e78284</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Rust metavariable names</string>
            <key>scope</key>
            <string>variable.other.metavariable.name.rust, meta.macro.metavariable.rust keyword.operator.macro.dollar.rust</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#f4b8e4</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Shell shebang</string>
            <key>scope</key>
            <string>comment.line.shebang, comment.line.shebang punctuation.definition.comment, comment.line.shebang, punctuation.definition.comment.shebang.shell, meta.shebang.shell</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#f4b8e4</string>
              <key>fontStyle</key>
              <string>italic</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Shell shebang command</string>
            <key>scope</key>
            <string>comment.line.shebang constant.language</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#81c8be</string>
              <key>fontStyle</key>
              <string>italic</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Shell interpolated command</string>
            <key>scope</key>
            <string>meta.function-call.arguments.shell punctuation.definition.variable.shell, meta.function-call.arguments.shell punctuation.section.interpolation, meta.function-call.arguments.shell punctuation.definition.variable.shell, meta.function-call.arguments.shell punctuation.section.interpolation</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#e78284</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Shell interpolated command variable</string>
            <key>scope</key>
            <string>meta.string meta.interpolation.parameter.shell variable.other.readwrite</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ef9f76</string>
              <key>fontStyle</key>
              <string>italic</string>
            </dict>
          </dict>
          <dict>
            <key>scope</key>
            <string>source.shell punctuation.section.interpolation, punctuation.definition.evaluation.backticks.shell</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#81c8be</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Shell EOF</string>
            <key>scope</key>
            <string>entity.name.tag.heredoc.shell</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ca9ee6</string>
            </dict>
          </dict>
          <dict>
            <key>name</key>
            <string>Shell quoted variable</string>
            <key>scope</key>
            <string>string.quoted.double.shell variable.other.normal.shell</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#c6d0f5</string>
            </dict>
          </dict>
          <dict>
            <key>scope</key>
            <string>markup.heading.synopsis.man, markup.heading.title.man, markup.heading.other.man, markup.heading.env.man</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#ca9ee6</string>
            </dict>
          </dict>
          <dict>
            <key>scope</key>
            <string>markup.heading.commands.man</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#8caaee</string>
            </dict>
          </dict>
          <dict>
            <key>scope</key>
            <string>markup.heading.env.man</string>
            <key>settings</key>
            <dict>
              <key>foreground</key>
              <string>#f4b8e4</string>
            </dict>
          </dict>
        </array>
      </dict>
    </plist>
  '';

  vesktopthemecss = builtins.toFile "theme.css" '''';
}