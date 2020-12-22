let
  pkgs = import <nixpkgs> {};
  swapi_example = import ./default.nix;
  alpineLatest = pkgs.dockerTools.pullImage {
    imageName = "alpine";
    imageDigest = "sha256:3c7497bf0c7af93428242d6176e8f7905f2201d8fc5861f45be7a346b5f23436";
    sha256 = "0dqmvchn79n5lvb0gs28wacyfjixi0a5hgipgd0fpqbam6kq0bsi";
    finalImageName = "alpine";
    finalImageTag = "latest";
  };
in
pkgs.dockerTools.buildImage {
  name = "swapi_example";
  tag = "latest";
  fromImage = alpineLatest;

  contents = swapi_example;

  config = {
    Cmd = [ "/bin/swapi_example" "eval" "Application.ensure_all_started(:swapi_example); SwapiExample.run" ];
  };
}
