{ pkgs, name }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [ gcc gnumake cmake ];
  shellHook = ''
    echo "🔧 C/C++ environment ready"
    cd ~/.local/care/${name}
  '';
}