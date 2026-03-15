{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  # Packages to be installed in the environment
  buildInputs = with pkgs; [
    nim           # The Nim compiler
    nimble        # Nim's package manager
    exercism      
  ];

  shellHook = ''
    echo "--- Nim Exercism Development Environment ---"
    echo "Nim version: $(nim --version | head -n 1)"
    echo "Exercism CLI: $(exercism version)"
    exercism configure --token=$LC_EXERCISM_API_TOKEN
    exercism configure -s
    echo "--------------------------------------------"
  '';
}
