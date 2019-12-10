defmodule Run do
  @files [
    "lib/the_ghost_inside_my_house.txt",
    "lib/the_ghost_inside_my_house.txt",
    "lib/the_ghost_inside_my_house.txt",
    "lib/the_ghost_inside_my_house.txt",
    "lib/the_ghost_inside_my_house.txt",
    "lib/the_ghost_inside_my_house.txt"
  ]

  def transform_all_files do
    parent = self()

    Enum.each(@files, fn file ->
      child =
        spawn(fn ->
          Gen.generate_new_text(file)
          send(parent, {:hello, self()})
          IO.inspect(self(), label: "in child")
        end)

      IO.inspect(child)
    end)

    receive()
  end

  def receive do
    receive do
      {:hello, msg} ->
        IO.inspect("Got done message from generate_new_text process with pid #{inspect(msg)}")
        receive()
    after
      1000 ->
        :ok
    end
  end
end
