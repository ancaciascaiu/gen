defmodule Gen do
  def generate_new_text("lib/the_ghost_inside_my_house.txt" = text_file) do
    {:ok, text} = File.read(text_file)

    text
    |> generate_word_map()
  end

  defp generate_word_map(text) do
    text
    |> String.split([" ", ",", "-", ".", "\n", "\n\n"])
    |> Stream.chunk_every(3, 1, :discard)
    |> Enum.to_list()
    |> add_or_update_pair()
  end

  defp add_or_update_pair(word_list) do
    word_list
    |> Enum.reduce(%{}, fn [word1, word2, word3], acc ->
      case Map.fetch(acc, word1) do
        :error ->
          Map.put(acc, word1, [word2, word3])

        {:ok, value} ->
          Map.put(acc, word1, value ++ [word2, word3])
      end
    end)
  end
end
