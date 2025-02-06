{
  description = "my personal space";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.${system}.default = pkgs.hugo;

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.hugo
          pkgs.git
        ];
      };

      apps.${system}.serve = {
        type = "app";
        program = "${pkgs.hugo}/bin/hugo serve";
      };
    };
}

