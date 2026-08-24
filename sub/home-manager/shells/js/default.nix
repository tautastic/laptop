{ pkgs, name }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [ nodejs ];
  shellHook = ''
    echo "📦 Node.js environment ready"
    cd ~/.local/care/${name}
  '';
}