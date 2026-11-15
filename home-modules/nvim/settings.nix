{...}: {
  programs.nvf.settings.vim = {
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

    utility = {
      surround.enable = true;
      diffview-nvim.enable = true;
    };

    git = {
      enable = true;
      gitsigns.enable = true;
    };

    autocomplete.nvim-cmp.enable = true;

    autopairs.nvim-autopairs.enable = true;

    snippets.luasnip.enable = true;

    utility.motion.hop.enable = true;

    notes.todo-comments.enable = true;

    treesitter.context.enable = false;
  };
}
