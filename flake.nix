{
  description = "A declarative NixOS system configuration using Flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-jetbrains-plugins = {
      url = "github:nix-community/nix-jetbrains-plugins";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-jetbrains-plugins, ... }:
  let
    hostname = "nixos";
    system = "x86_64-linux";
    stateVersion = "26.05";

    username = "tau";
    passwordHash = "DUMMY_HASH_REPLACE_DURING_INSTALL";

    gitUsername = "tautastic";
    gitUseremail = "tautastic@proton.me";
  in
  {
    nixosConfigurations."${hostname}" = nixpkgs.lib.nixosSystem {
      system = system;

      specialArgs = {
        inherit hostname system stateVersion username passwordHash gitUsername gitUseremail;
      };

      modules = [
        { system.stateVersion = stateVersion; }
        home-manager.nixosModules.home-manager {
          home-manager.extraSpecialArgs = {
            inherit nix-jetbrains-plugins;
          };
        }
        ./sub/home-manager/home.nix
        ./sub/docker.nix
        ./sub/user.nix
        ./sub/hardware-configuration.nix
        ./sub/boot.nix
        ./sub/postgresql.nix
        ./sub/ssh.nix
        ./sub/gnome-desktop.nix
        ./sub/system-packages.nix
        ./sub/system-settings.nix
      ];
    };
  };
}
