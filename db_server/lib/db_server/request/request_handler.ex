defmodule DBServer.Request.RequestHandler do
  alias DbServer.RepoFunctions

  def username(id, request_from) do
    userdata = RepoFunctions.Users.get(id)

    IO.inspect(userdata.name)
    data = {:data, userdata.name}
    send(request_from, data)
  end
end