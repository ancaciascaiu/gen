defmodule GenTest do
  use ExUnit.Case

  test "generate_new_text/1" do
    text_file = "lib/the_ghost_inside_my_house.txt"
    result = Gen.generate_new_text(text_file)

    assert result["he’s"] == ["younger", "than"]
    assert result["garden"] == ["while", "my", "for", "what", "we", "saw", "where", "the"]
  end
end
