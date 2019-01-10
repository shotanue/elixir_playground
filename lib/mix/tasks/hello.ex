# Taskを作る時は namespaceをMix.Tasks.XXXXにする
defmodule Mix.Tasks.Hello do
  #  Task用のモジュールを読み込む
  use Mix.Task
  
  # shortdocで mix helpした時のコメントを書ける
  @shortdoc "my first task"
  def run(_) do
    IO.putsElixirPlayground.helloWorld()
  end
end
