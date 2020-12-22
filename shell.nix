let
  pkgs = import <nixpkgs> {};
  elixir = pkgs.beam.packages.erlangR22.elixir_1_10;
in
with pkgs; mkShell {
  buildInputs = [
    docker
    elixir
  ];

  shellHook =
  ''
    # ERL_LIBS causes a load of compile warnings (warning: this clause cannot
    # match because a previous clause at line 1 always matches) in the standard
    # library. It appears to be because things are evaluated twice.
    # An actual export -n isn't inherited properly so we just set it blank.
    export ERL_LIBS=""
  '';

  ERL_AFLAGS = "-kernel shell_history enabled";

  ERL_INCLUDE_PATH="${elixir}/lib/erlang/usr/include";

  LOCALE_ARCHIVE = "${glibcLocales}/lib/locale/locale-archive";
}
