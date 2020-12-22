let
  pkgs = import <nixpkgs> {};
  elixir = pkgs.beam.packages.erlangR22.elixir_1_10;
  buildMix = pkgs.beam.packages.erlangR22.buildMix.override { inherit elixir; };
in
with pkgs;
buildMix rec {
  name = "swapi_example";
  version = "0.1.0";
  src = nix-gitignore.gitignoreSourcePure [ "erl_crash.dump" "*.ez" "swapi_example-*.tar" ] ./.;

  buildInputs = [
    elixir
  ];

  buildPhase = ''
    runHook preBuild

    export HEX_OFFLINE=1
    export HEX_HOME=`pwd`
    export MIX_ENV=prod
    export MIX_NO_DEPS=1

    mix compile --no-deps-check
    mix release --no-deps-check --overwrite

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    cp -Hr "_build/prod/rel/${name}" "$out"

    runHook postInstall
  '';
}
