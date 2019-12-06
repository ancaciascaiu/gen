defmodule Gen do
  def generate_new_text("lib/the_ghost_inside_my_house.txt" = text_file) do
    text = File.read(text_file)
  end
end
