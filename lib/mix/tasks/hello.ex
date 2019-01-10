defmodule Mix.Tasks.Hello do
  use Mix.Task
  
  @shortdoc "my first task"
  def run(_) do
    IO.putsElixirPlayground.helloWorld()
  end
end
