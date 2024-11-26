{pkgs, ...}: {
  config.vim = {
    theme = {
      enable = true;
      name = "rose-pine";
      style = "main";
    };
    extraPlugins = {
      mini-statusline = {
        package = pkgs.vimPlugins.mini-nvim;
        setup = "require('mini.statusline').setup {}";
      };
    };
    binds.whichKey.enable = true;
    filetree.nvimTree.enable = true;
    treesitter.enable = true;
    git = {
      enable = true;
      gitsigns.enable = true;
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
    };
    visuals = {
      indent-blankline.enable = true;
    };
    viAlias = true;
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
  };
}
