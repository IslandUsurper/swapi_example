defmodule SwapiExampleTest do
  use ExUnit.Case
  doctest SwapiExample

  test "greets the world" do
    assert SwapiExample.hello() == :world
  end
end
