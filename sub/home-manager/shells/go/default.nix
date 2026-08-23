{ pkgs, name }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [ go ];
  shellHook = ''
    echo "🐹 Go environment ready $(go version)"
    cd ~/.local/care/${name}
  '';
}