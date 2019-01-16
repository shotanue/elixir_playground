defmodule Mix.Tasks.MyServer do
  use Mix.Task

  @shortdoc "Start MyServer from Mix.Task"
  def run(_) do
    # これはダメらしい
    # DynamicSupervisor.start_link([name:  MyServer.Supervisor, strategy: :one_for_one])
    # res = Task.async(MyServer,:start,[[],[]])

    # 　phoenixのphx.serverを参考にしたがこれもダメ。
    # 　起動するが、プロセスがすぐ落ちる　mix run --no-halt 的なことをやりたいが不明
    Application.put_env(:my_server, :serve_endpoints, true, persistent: true)

    Mix.Tasks.Run.run([])
  end
end
