{
  description = "Someone's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, home-manager }@inputs: 
  let
    system = "x86_64-linux";
    homeCfgs = (import ./home/default.nix {
      inherit nixpkgs home-manager system;
    });
  in {
    defaultPackage.x86_64-linux = homeCfgs.intm.activationPackage;
    packages.x86_64-linux.homeIntm = homeCfgs.intm.activationPackage;
    packages.x86_64-linux.homeDevbox = homeCfgs.devbox.activationPackage;
  };
}
