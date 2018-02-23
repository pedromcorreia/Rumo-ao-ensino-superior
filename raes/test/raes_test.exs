defmodule RAESTest do
  use ExUnit.Case
  doctest RAES

  test "greets the world" do
    assert RAES.hello() == :world
  end
end
