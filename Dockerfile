FROM alpine:latest
ADD _build/prod/rel/swapi_example /
CMD ["bin/swapi_example", "eval", "Application.ensure_all_started(:swapi_example); SwapiExample.run"]
