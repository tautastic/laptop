{ pkgs, name }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [ ghc ];
  shellHook = ''
    echo "λ Haskell environment ready $(ghc --version | cut -d' ' -f8)"
    cd ~/.local/care/${name}
  '';
}