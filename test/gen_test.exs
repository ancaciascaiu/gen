defmodule GenTest do
  use ExUnit.Case

  test "generate_new_text/1" do
    text_file = "lib/the_ghost_inside_my_house.txt"
    {:ok, text} = Gen.generate_new_text(text_file)

    assert String.starts_with?(text, "The Ghosts Inside My House")
  end
end
