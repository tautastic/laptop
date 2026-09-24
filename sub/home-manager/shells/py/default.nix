{ pkgs, name }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [ python3 ];
  shellHook = ''
    echo "🐍 Python environment ready"
    cd ~/.local/care/${name}
  '';
}