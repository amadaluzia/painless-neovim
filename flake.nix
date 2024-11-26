{
  inputs = {
    nixpkgs = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "nixos-unstable";
    };
    nvf = {
      type = "github";
      owner = "NotAShelf";
      repo = "nvf";
      ref = "v0.7";
    };
  };
  outputs = inputs @ {nixpkgs, ...}: let
    systems = ["x86_64-linux"];
    forAllSystems = f:
      nixpkgs.lib.genAttrs systems (system:
        f (import inputs.nixpkgs {
          inherit system;
        }));
  in {
    packages = forAllSystems (pkgs: {
      default =
        (inputs.nvf.lib.neovimConfiguration {
          modules = [
            {
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
          ];
          inherit pkgs;
        })
        .neovim;
    });
  };
}
