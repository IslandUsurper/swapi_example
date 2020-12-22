# SwapiExample

A small example of using the [Star Wars API](https://swapi.dev/) to list all of
the starships and their pilots that have appeared in the Star Wars film canon.

## Installation

### Nix (preferred)

```
nix-shell # Downloads Docker and Elixir, and then starts a new shell with them in your path.
export MIX_ENV=prod
mix deps.get
mix compile
nix-build docker.nix # This step builds the release and puts it in an image.
docker load <result
docker run swapi_example:latest
```

### Elixir

Run the following commands:

```
export MIX_ENV=prod
mix deps.get
mix compile
mix release
_build/prod/rel/swapi_example/bin/swapi_example eval 'Application.ensure_all_started(:swapi_example); SwapiExample.run'
```

### Docker

Run the following commands:

```
export MIX_ENV=prod
mix deps.get
mix compile
mix release
docker build -t swapi_example:latest .
docker run swapi_example:latest
```

