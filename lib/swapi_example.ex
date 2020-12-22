defmodule SwapiExample do
  @moduledoc """
  Lists all of the starships and their respective pilots from the Star Wars
  API.
  """

  alias SwapiExample.Client

  @doc """
  The main entrypoint of the program.
  """
  def run do
    IO.puts("Starship Model\t| Starship Name\t| Pilots")
    {:ok, resp} = Client.starships()

    print_starships(resp)
  end

  defp print_starships(resp) do
    starships = resp.body["results"]

    for starship <- starships do
      pilots = for pilot_url <- starship["pilots"] do
        {:ok, resp} = Client.get(pilot_url)
        pilot = resp.body
        pilot["name"]
      end

      IO.puts("#{starship["model"]}\t| #{starship["name"]}\t| " <> Enum.join(pilots, ", "))
    end

    if resp.body["next"] do
      {:ok, next_resp} = Client.get(resp.body["next"])
      print_starships(next_resp)
    end
  end
end
