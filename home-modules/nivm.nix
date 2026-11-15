{pkgs, ...}: {
  programs.nvf = {
    enable = true;

    settings.vim = {
      viAlias = false;
      vimAlias = true;

      options = {
        number = true;
        relativenumber = true;
        cursorline = false;
        termguicolors = true;
        signcolumn = "yes";
        scrolloff = 8;
        tabstop = 2;
        shiftwidth = 2;
        expandtab = true;
        wrap = false;
        ignorecase = true;
        smartcase = true;
        clipboard = "unnamedplus";
        cmdheight = 0;
        laststatus = 3;
      };

      ui = {
        noice.enable = true;
        borders.enable = true;
        illuminate.enable = true;
        colorizer.enable = true;
      };

      theme = {
        enable = true;
        name = "gruvbox";
        style = "dark";
        transparent = true;
      };

      tabline.nvimBufferline = {
        enable = true;
        setupOpts = {
          options = {
            diagnostics = "nvim_lsp";
            always_show_bufferline = false;

            numbers = "none";
            modified_icon = "●";
            indicator = {
              style = "icon";
              icon = "▎";
            };

            show_buffer_icons = true;
            show_buffer_close_icons = true;
            show_close_icon = false;

            offsets = [
              {
                filetype = "snacks_layout_box";
              }
            ];
          };
        };
      };

      statusline.lualine = {
        enable = true;
      };

      dashboard.alpha.enable = true;
      visuals = {
        indent-blankline.enable = true;
        nvim-cursorline.enable = true;
        fidget-nvim.enable = true;
      };

      extraPlugins.mini-icons = {
        package = pkgs.vimPlugins.mini-icons;
        setup = ''
          require("mini.icons").setup()
          MiniIcons.mock_nvim_web_devicons()
        '';
      };

      binds.whichKey.enable = true;

      globals.mapleader = " ";

      autocomplete.nvim-cmp.enable = true;
      snippets.luasnip.enable = true;

      lsp = {
        enable = true;
        formatOnSave = true;
        trouble.enable = true;
        lightbulb.enable = false;
      };

      diagnostics = {
        enable = true;
        config = {
          virtual_text = {
            spacing = 4;
            prefix = "●";
            source = "if_many";
          };
          signs = false;
          underline = true;
          virtual_lines = false;
        };
      };

      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = false;

        nix.enable = true;
        lua.enable = true;
        bash.enable = true;
        markdown.enable = true;
        json.enable = true;
        css.enable = true;
        html.enable = true;
        clang.enable = true;
        python.enable = true;
      };

      utility.snacks-nvim = {
        enable = true;
        setupOpts = {
          explorer.enabled = true;
          picker.enabled = true;
        };
      };

      git = {
        enable = true;
        gitsigns.enable = true;
      };

      notify.nvim-notify.enable = true;

      autopairs.nvim-autopairs.enable = true;
      treesitter.context.enable = false;
      utility = {
        surround.enable = true;
        diffview-nvim.enable = true;
      };
      notes.todo-comments.enable = true;

      utility.motion.hop.enable = true;

      keymaps = [
        {
          key = "<leader>ff";
          mode = "n";
          action = "<cmd>lua Snacks.picker.files()<CR>";
          desc = "Find files";
        }
        {
          key = "<leader>fg";
          mode = "n";
          action = "<cmd>lua Snacks.picker.grep()<CR>";
          desc = "Live grep";
        }
        {
          key = "<leader>fb";
          mode = "n";
          action = "<cmd>lua Snacks.picker.buffers()<CR>";
          desc = "Find buffers";
        }
        {
          key = "<leader>e";
          mode = "n";
          action = "<cmd>lua Snacks.explorer()<CR>";
          desc = "File explorer";
        }
        {
          key = "<leader>xx";
          mode = "n";
          action = "<cmd>Trouble diagnostics toggle<CR>";
          desc = "Diagnostics";
        }
        {
          key = "<leader>gg";
          mode = "n";
          action = "<cmd>DiffviewOpen<CR>";
          desc = "Git diff";
        }
      ];

      luaConfigPost = ''

        require("notify").setup({
         background_colour = "#000000",
        })

        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
          "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
          "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
          "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
          "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
          "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
          "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
        }

        dashboard.section.buttons.val = {
          dashboard.button("e", "  New file", "<cmd>ene<CR>"),
          dashboard.button("f", "󰈞  Find file", "<cmd>lua Snacks.picker.files()<CR>"),
          dashboard.button("h", "󰊄  Recently opened files", "<cmd>lua Snacks.picker.recent()<CR>"),
          dashboard.button("g", "󰈬  Find word", "<cmd>lua Snacks.picker.grep()<CR>"),
          dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
        }

        require("alpha").setup(dashboard.config)
      '';
    };
  };
}
