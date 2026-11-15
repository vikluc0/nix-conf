{...}: {
  programs.nvf.settings.vim = {
    globals.mapleader = " ";

    binds.whichKey.enable = true;

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
  };
}
