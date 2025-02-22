{pkgs, ...}: let
  inherit (pkgs) vimPlugins;
in {
  config.vim = {
    extraPlugins = {
      mini-statusline = {
        package = vimPlugins.mini-nvim;
        setup = "require('mini.statusline').setup {}";
      };
    };
    extraLuaFiles = [
      ./neovide.lua
    ];
    theme = {
      name = "mini-base16";
      enable = true;
      base16-colors = builtins.fromJSON (builtins.readFile ./everforest.json);
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
      lspsaga.enable = true;
      otter-nvim.enable = true;
      nvim-docs-view.enable = true;
      trouble.enable = true;
      null-ls.enable = true;
    };
    debugger.nvim-dap = {
      enable = true;
      ui.enable = true;
    };
    languages = {
      enableFormat = true;
      enableLSP = true;
      enableDAP = false;
      enableTreesitter = true;
      enableExtraDiagnostics = true;
      nix.enable = true;
      lua.enable = true;
      ts.enable = true;
      go.enable = true;
      haskell.enable = true;
      python = {
        enable = true;
        format = {
          type = "ruff";
          package = pkgs.ruff;
        };
        lsp = {
          package = pkgs.pyright;
          server = "pyright";
        };
      };
      rust.enable = true;
      zig.enable = true;
      nu.enable = true;
      nim.enable = true;
    };
    visuals = {
      indent-blankline.enable = true;
      nvim-web-devicons.enable = true;
      fidget-nvim.enable = true;
    };
    notes = {
      orgmode.enable = true;
      todo-comments.enable = true;
    };
    ui = {
      borders = {
        enable = true;
        globalStyle = "single";
      };
      noice.enable = true;
      colorizer.enable = true;
      illuminate.enable = true;
      breadcrumbs = {
        enable = true;
        navbuddy.enable = true;
      };
      smartcolumn = {
        enable = true;
        setupOpts.custom_colorcolumn = {
          nix = "110";
          ruby = "120";
          java = "130";
          go = ["90" "130"];
        };
      };
      fastaction.enable = true;
    };
    keymaps = [
      {
        key = ":";
        mode = "n";
        silent = true;
        action = "q:";
      }
      {
        key = "\\";
        mode = "n";
        silent = true;
        action = ":";
      }
    ];
    treesitter = {
      enable = true;
      fold = true;
      indent.enable = true;
      context.enable = true;
      highlight.enable = true;
      incrementalSelection.enable = true;
    };
    filetree.nvimTree = {
      enable = true;
      openOnSetup = true;
      setupOpts = {
        disable_netrw = true;
        filters = {
          git_ignored = true;
        };
        git = {
          enable = true;
        };
        view = {
          relativenumber = true;
          side = "right";
          float.enable = true;
        };
      };
    };
    dashboard.alpha.enable = true;
    binds.whichKey.enable = true;
    notify.nvim-notify.enable = true;
    comments.comment-nvim.enable = true;
    autocomplete.nvim-cmp.enable = true;
    snippets.luasnip.enable = true;
    projects.project-nvim.enable = true;
    spellcheck.enable = true;
    telescope.enable = true;
    viAlias = true;
    vimAlias = true;
  };
}
