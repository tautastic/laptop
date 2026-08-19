{ pkgs, name }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [ elan lean4 ];
  shellHook = ''
    echo "📚 Lean environment ready"
    cd ~/.local/care/${name}
  '';
}