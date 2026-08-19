{ pkgs, name }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [ opam ocaml dune ];
  shellHook = ''
    echo "🐫 OCaml environment ready"
    cd ~/.local/care/${name}
  '';
}