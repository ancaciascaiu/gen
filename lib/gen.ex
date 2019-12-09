defmodule Gen do
  def generate_new_text(text_file) do
    {:ok, text} = File.read(text_file)

    text
    |> generate_word_map()
    |> generate_text()
  end

  defp generate_word_map(text) do
    text
    |> String.split([" ", ",", "-", ".", "\n", "\n\n"])
    |> Stream.chunk_every(3, 1, :discard)
    |> Enum.to_list()
    |> add_or_update_pair()
  end

  defp generate_text(text_map) do
    text_map
    |> Enum.reduce("", fn {key, _value}, acc ->
      acc <> " " <> key <> " " <> get_random_value(text_map, key)
    end)
  end

  defp get_random_value(text_map, key) do
    {:ok, value} = Map.fetch(text_map, key)
    Enum.random(value)
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
