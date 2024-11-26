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
            ./nvf.nix
          ];
          inherit pkgs;
        })
        .neovim;
    });
  };
}
