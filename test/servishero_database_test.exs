defmodule ServisheroDatabaseTest do
  use ExUnit.Case
  doctest ServisheroDatabase

  test "greets the world" do
    assert ServisheroDatabase.hello() == :world
  end
end
