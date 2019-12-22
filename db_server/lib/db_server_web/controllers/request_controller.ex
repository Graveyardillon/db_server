defmodule DbServerWeb.RequestController do
  use DbServerWeb, :controller

  alias DBServer.Request.RequestHandler

  def start_node(conn, _params) do
    Application.get_env(:db_server, :db_node)
    |> Node.start
    IO.puts "node started!"
    render(conn, "index.json")
  end

  def receive_request(conn, _params) do
    server_pid = spawn(__MODULE__, :request_handle, [])
    :global.register_name(:db_node_receiveRequest, server_pid)
    render(conn, "index.json")
  end

  def request_handle() do #ここでエラーが起きたら再起処理に入れず死ぬ。再起動が修正が必要。
    receive do
      {:message, message} -> #テスト用
        IO.puts (message)

      {:request_username, id, request_from} ->
        IO.puts (id)
        spawn(RequestHandler, :username, [id, request_from])
      _ ->
        IO.puts "idk this."

    end
    request_handle()
  end

  def stop_receiving_request(conn, _params) do
    Process.exit(:global.whereis_name(:db_node_receiveRequest), :normal)
    :global.unregister_name(:db_node_receiveRequest)
    render(conn, "index.json")
  end
end
