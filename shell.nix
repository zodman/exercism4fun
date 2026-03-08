{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  # Packages to be installed in the environment
  buildInputs = with pkgs; [
    nim           # The Nim compiler
    nimble        # Nim's package manager
    
    # Exercism CLI for downloading and submitting exercises
    exercism      
    
    # Optional but highly recommended for Nim development
    nimlsp        # Language Server for VS Code/Vim support
    nimsuggest    # Tool for completion and static analysis
  ];

  # Shell commands to run upon entering the environment
  shellHook = ''
    echo "--- Nim Exercism Development Environment ---"
    echo "Nim version: $(nim --version | head -n 1)"
    echo "Exercism CLI: $(exercism version)"
    echo "--------------------------------------------"
  '';
}
