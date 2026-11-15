{pkgs, ...}: {
  programs.nvf.settings.vim = {
    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
      transparent = true;
    };

    dashboard.alpha.enable = true;

    ui = {
      noice.enable = true;
      borders.enable = true;
      illuminate.enable = true;
      colorizer.enable = true;
    };

    visuals = {
      indent-blankline.enable = true;
      nvim-cursorline.enable = true;
      fidget-nvim.enable = true;
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

    utility.snacks-nvim = {
      enable = true;
      setupOpts = {
        explorer.enabled = true;
        picker.enabled = true;
      };
    };

    extraPlugins.mini-icons = {
      package = pkgs.vimPlugins.mini-icons;
      setup = ''
        require("mini.icons").setup()
        MiniIcons.mock_nvim_web_devicons()
      '';
    };

    notify.nvim-notify.enable = true;

    statusline.lualine.enable = true;

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
}
