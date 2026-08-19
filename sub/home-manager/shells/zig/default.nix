{ pkgs, name }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [ zig ];
  shellHook = ''
    echo "⚡ Zig environment ready $(zig version)"
    cd ~/.local/care/${name}
  '';
}