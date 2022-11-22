defmodule PeopleFeederTest do
  use ExUnit.Case
  doctest PeopleFeeder

  test "greets the world" do
    assert PeopleFeeder.hello() == :world
  end
end
