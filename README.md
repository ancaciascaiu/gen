# Gen
This is a toy app that implements Elixir Processes. 

Steps I took:
1. Watch talk “The Soul of Erlang and Elixir”: https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=2ahUKEwjv2fXvy9vlAhUtwVkKHTdXDPAQwqsBMAB6BAgJEAQ&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DJvBT4XBdoUE&usg=AOvVaw2sTWyTLEZv_2GrxjhIpPs6 
2. Spin new mix app
3. install Mix test watch, credo, to make it production-like
4. Kata: https://github.com/samjonester/awesome-katas/blob/master/katas/trigrams.md
5. Do TDD

6. Extension: give it a list of files and spin up processes
7. Extension2: Add genserver that acts like a dictionary (for state) and then keep feeding it text from files
8. Extension3: Wrap the GenServer under the mix app’s supervision tree(there’s an example in Manifold) or under a Phoenix app

New things to learn: 
-spawn(the most primitive way to create a process
-task
-the difference between Enum, Stream, Flow
-abstraction
-GenServers

## Installation

During implementation, use:
mix credo --strict (it enforces a style guide)
mix test.watch (detects changes and runs tests)
iex -S mix (console)
