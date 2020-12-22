defmodule SwapiExample.Client do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://swapi.dev/api/"
  plug Tesla.Middleware.FollowRedirects
  plug Tesla.Middleware.JSON

  def starships() do
    get("/starships/")
  end

  def people() do
    get("/people/")
  end

  def person(id) do
    get("/people/#{id}/")
  end
end
