defmodule DBServer.Request.RequestHandler do
  alias DbServer.RepoFunctions

  def username(id) do
    userdata = RepoFunctions.Users.get(id)
    IO.inspect(userdata.name)
    IO.inspect(self())
  end
end