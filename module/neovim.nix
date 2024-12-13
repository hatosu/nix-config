{ pkgs, ... }: {

  # conform-nvim, which-key, colorscheme, telescope, font, treesitter, oil, git, other binds, parts you dont know abt still

  environment.shellAliases.v = "sudo -E neovide";

  home-manager.users.hatosu.programs = {

    neovide = {
      enable = true;
      settings = {
        vsync = true;
      };
    };

    nixvim = {
      enable = true;

      package = pkgs.neovim-unwrapped;

      defaultEditor = true;
      viAlias = true;
      vimAlias = true;

      opts = {
        guifont = "Source Code Pro:h10";
        relativenumber = true;
        shiftwidth = 2;
        # mouse = "";
      };

      performance = {
        combinePlugins = {
          enable = true;
        };
        byteCompileLua.enable = true;
      };

      clipboard = {
        register = "unnamedplus";
        providers.wl-copy.enable = true;
      };

      plugins = {

        nix.enable = true;

        telescope.enable = true;

        treesitter.enable = true;

        web-devicons.enable = true;

        lsp = {
          enable = true;
          servers = {

            nil_ls = {
              enable = true;
            };

            clangd = {
              enable = true;
            };

            rust_analyzer = {
              enable = true;
              installCargo = false;
              installRustc = false;
            };

            gopls = {
              enable = true;
            };

            zls = {
              enable = true;
            };

            lua_ls = {
              enable = true;
              settings = {
                telemetry.enable = false;
              };
            };

            bashls = {
              enable = true;
            };

            html = {
              enable = true;
            };

            marksman = {
              enable = true;
            };

            hls = {
              enable = true;
              installGhc = true;
            };

            typos_lsp = {
              enable = true;
              extraOptions.init_options.diagnosticSeverity = "Hint";
            };
          
          };
        };

        oil = {
          enable = true;
          settings = {
            defaultFileExplorer = true;
            delete_to_trash = true;
          };
        };

        luasnip = {
          enable = true;
          settings = {
            enable_autosnippets = true;
            store_selection_keys = "<Tab>";
          };
        };

        lint = {
          enable = true;
          lintersByFt = {
            rst = ["vale"];
            text = ["vale"];
            c = ["clangtidy"];
            cpp = ["clangtidy"];
            haskell = ["hlint"];
            json = ["jsonlint"];
            bash = ["shellcheck"];
            shell = ["shellcheck"];
            clojure = ["clj-kondo"];
            nix = ["nix"];
            dockerfile = ["hadolint"];
            markdown = ["markdownlint"];
          };
        };

        cmp = {
          enable = true;
          autoEnableSources = true;
          settings = {
            autocomplete = true;
            sources = [{name = "nvim_lsp";}];
            performance = {
              debounce = 200;
              throttle = 200;
              maxViewEntries = 5;
            };
            snippet.expand = ''
              function(args)
                require('luasnip').lsp_expand(args.body)
              end
            '';
            mapping = {
              "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
              "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
              "<C-j>" = "cmp.mapping.select_next_item()";
              "<C-k>" = "cmp.mapping.select_prev_item()";
              "<C-e>" = "cmp.mapping.abort()";
              "<C-b>" = "cmp.mapping.scroll_docs(-4)";
              "<C-f>" = "cmp.mapping.scroll_docs(4)";
              "<C-Space>" = "cmp.mapping.complete()";
              "<CR>" = "cmp.mapping.confirm({ select = false })";
              "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
            };
            window = {
              completion.scrollbar = true;
              documentation.border = "single";
            };
          };
        };

        undotree = {
          enable = true;
          settings = {
            CursorLine = true;
            DiffAutoOpen = true;
            DiffCommand = "diff";
            DiffpanelHeight = 10;
            HelpLine = true;
            HighlightChangedText = true;
            HighlightChangedWithSign = true;
            HighlightSyntaxAdd = "DiffAdd";
            HighlightSyntaxChange = "DiffChange";
            HighlightSyntaxDel = "DiffDelete";
            RelativeTimestamp = true;
            SetFocusWhenToggle = true;
            ShortIndicators = false;
            SplitWidth = 40;
            TreeNodeShape = "*";
            TreeReturnShape = "\\";
            TreeSplitShape = "/";
            TreeVertShape = "|";
            WindowLayout = 4;
          };
        };

        presence-nvim = {
          enable = true;
          neovimImageText = "buh...";
          extraOptions.main_image = "https://files.catbox.moe/ytspyv.png";
          package = pkgs.vimPlugins.presence-nvim.overrideAttrs (oldAttrs: {
            src = pkgs.fetchFromGitHub {
              owner = "andweeb";
              repo = "presence.nvim";
              rev = "0dbcdebb2f1feeecdad7a6286a50575bf07d7533";
              sha256 = "sha256-ajiA/2zVJ/aRBW69DDmNT/c/S09moE5bl8ziZQ+9OBs=";
            };
          });
        };

      };

      extraPlugins = with pkgs.vimPlugins; [
        {
          plugin = comment-nvim;
          config = "lua require(\"Comment\").setup()";
        }
      ];

      autoCmd = [
        {
          event = ["BufEnter" "BufWinEnter"];
          pattern = ["*.c" "*.h"];
          command = "echo 'Entering a C/C++ file";
        }
      ];

      globals.mapleader = ''\'';

      keymaps = [
        {action = "<cmd>Telescope live_grep<CR>"; key = "<leader>g";}
        # {action = "<Nop>"; key = "<Left>"; options.noremap = true; mode = [ "v" "n" "i" ];}
        # {action = "<Nop>"; key = "<Right>"; options.noremap = true; mode = [ "v" "n" "i" ];}
        # {action = "<Nop>"; key = "<Up>"; options.noremap = true; mode = [ "v" "n" "i" ];}
        # {action = "<Nop>"; key = "<Down>"; options.noremap = true; mode = [ "v" "n" "i" ];}
      ];

      colorschemes.palette = let

        palette = {
          base00 = "#1C1C1B"; # background
          base07 = "#FFFFFD"; # most text
          base0F = "#EB7757"; # numbers 
          base01 = "#3C3836"; # highlight row & scrollbar
          base03 = "#665C54"; # comments
          base04 = "#72837C"; # line numbers
          base05 = "#BDAE93"; # operators & delimiters
          base08 = "#FBF1C7"; # functions
          base09 = "#B2DBC7"; # illuminate
          base0A = "#A7D6AA"; # ! or booleans
          base06 = "#D5C4A1"; # idk
          base0B = "#A3CFC4"; # idk
          base0C = "#8BCCA5"; # idk
          base0D = "#DA9B58"; # idk
          base0E = "#93C2AB"; # idk
          base02 = "#504945"; # idk
        };
      
      in {

        enable = true;
        settings = {
          palettes = {
            main = "main_tempest";
            accent = "accent_tempest";
            state = "state_tempest";
          };
          custom_palettes = {
            main = {
              main_tempest = {
                color0 = "${palette.base00}";
                color1 = "${palette.base01}"; 
                color2 = "${palette.base0A}"; 
                color3 = "${palette.base04}";
                color4 = "${palette.base05}"; 
                color5 = "${palette.base06}"; 
                color6 = "${palette.base03}"; 
                color7 = "${palette.base08}"; 
                color8 = "${palette.base07}"; 
              };
            };
            accent = {
              accent_tempest = {
                accent0 = "${palette.base0F}";
                accent1 = "${palette.base09}";
                accent2 = "${palette.base0E}";
                accent3 = "${palette.base0D}"; 
                accent4 = "${palette.base0A}"; 
                accent5 = "${palette.base0B}";
                accent6 = "${palette.base0C}";
              };
            };
            state = {
              state_tempest = {
                hint = "${palette.base0C}";
                info = "${palette.base0D}";
                ok = "${palette.base0B}";
                warning = "${palette.base0A}";
                error = "${palette.base0F}";
              };
            };
          };
        };

        luaConfig.post = ''
          local colors = require("palette.theme")
          require("palette").setup({
            custom_highlight_group = "Corrections",
            custom_highlight_groups = {
              Corrections = {
          	{
          	  "@tag.builtin.tsx",
          	  colors.accent.accent5,
          	},
          	{
          	  "@tag.tsx",
          	  colors.accent.accent6,
          	},
          	{
          	  "@tag.attribute.tsx",
          	  colors.accent.accent2,
          	},
          	{
          	  "Search",
          	  colors.accent.accent3,
          	},
          	{
          	  "Keyword",
          	  colors.accent.accent2,
          	},
          	{
          	  "VisualMode",
          	  colors.accent.accent2,
          	},
          	{
          	  "Directory",
          	  colors.accent.accent2,
          	},
          	{
          	  "Special",
          	  colors.main.color5,
          	},
          	{
          	  "SpecialChar",
          	  colors.main.color5,
          	},
          	{
          	  "Type",
          	  colors.accent.accent5,
          	},
          	{
          	  "String",
          	  colors.main.color4,
          	},
          	{
          	  "@variable",
          	  colors.accent.accent4,
          	},
              },
            },
          })
          vim.cmd([[colorscheme palette]])
        '';
      
      };
    };
  };
}
