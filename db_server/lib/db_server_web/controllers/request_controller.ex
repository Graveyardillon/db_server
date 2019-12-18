defmodule DbServerWeb.RequestController do
  use DbServerWeb, :controller

  def start_node(conn, _params) do
    Application.get_env(:db_server, :db_node)
    |> Node.start
    # IO.puts "node started!"
    render(conn, "index.json")
  end

  def receive_request(conn, _params) do
    server_pid = spawn(DbServerWeb.RequestController, :request_handle, [])
    :global.register_name(:receiveRequest_node, server_pid)
    render(conn, "index.json")
  end

  def request_handle() do
    receive do
      request ->
        IO.inspect(request)
        IO.puts "got request!"
        request.()
    end
    request_handle()
  end

  def stop_receiving_request() do
    Process.exit(:global.whereis_name(:receiveRequest_node), :normal)
    :global.unregister_name(:receiveRequest_node)
  end
end
