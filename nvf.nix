{pkgs, ...}: {
  config.vim = {
    extraPlugins = {
      mini-statusline = {
        package = pkgs.vimPlugins.mini-nvim;
        setup = "require('mini.statusline').setup {}";
      };
      nightfox = {
        package = pkgs.vimPlugins.nightfox-nvim;
        setup = "vim.cmd('colorscheme carbonfox')";
      };
    };
    theme = {
      enable = true;
      style = "dark";
    };
    terminal.toggleterm = {
      enable = true;
      lazygit.enable = true;
    };
    git = {
      enable = true;
      gitsigns.enable = true;
      gitsigns.codeActions.enable = true;
      vim-fugitive.enable = true;
    };
    lsp = {
      enable = true;
      formatOnSave = true;
      lspSignature.enable = true;
      lsplines.enable = true;
      lspsaga.enable = true;
    };
    languages = {
      enableFormat = true;
      enableLSP = true;
      enableTreesitter = true;
      nix.enable = true;
      lua.enable = true;
      ts.enable = true;
      go.enable = true;
    };
    visuals = {
      indent-blankline.enable = true;
      nvim-web-devicons.enable = true;
      fidget-nvim.enable = true;
    };
    maps = {
      normal = {
        ":" = {
          silent = true;
          action = "q:";
        };
        "<leader>:" = {
          silent = true;
          action = ":";
        };
      };
    };
    notes = {
      orgmode.enable = true;
      todo-comments.enable = true;
    };
    ui.noice.enable = true;
    binds.whichKey.enable = true;
    filetree.nvimTree.enable = true;
    treesitter.context.enable = true;
    notify.nvim-notify.enable = true;
    comments.comment-nvim.enable = true;
    autocomplete.nvim-cmp.enable = true;
    projects.project-nvim.enable = true;
    telescope.enable = true;
    treesitter.enable = true;
    viAlias = true;
    vimAlias = true;
  };
}
