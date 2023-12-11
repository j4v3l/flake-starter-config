{
  # Description of the flake
  description = "Nixos config flake";

  # Inputs for the flake
  inputs = {
    # URL for the nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home-manager input, it's commented out
    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  # Outputs function, it's a function that takes several arguments
  outputs = { self, nixpkgs, ... }@inputs:
    let
      # System architecture
      system = "x86_64-linux";
      # Legacy packages for the system
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # NixOS configurations
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        # Special arguments for the system
        specialArgs = {inherit inputs;};
        # Modules for the system
        modules = [ 
          # Path to the configuration.nix file
          ./configuration.nix
          # Home-manager module, it's commented out
          # inputs.home-manager.nixosModules.default
        ];
      };
    };
}