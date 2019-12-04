defmodule GenTest do
  use ExUnit.Case
  doctest Gen

  test "greets the world" do
    assert Gen.hello() == :world
  end
end
