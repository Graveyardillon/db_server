defmodule DbServerWeb.API.GameController do
  use DbServerWeb, :controller

  # TODO: this index function has to show all games from db
  def index(conn, _params) do
    render(conn, :index)
  end

  def create(conn, _params) do
    name = conn.params["name"]

    case Games.create(name) do
      {:ok, struct} ->
        render(conn, :create, struct)
      
      {:error, changeset} ->
        creation_failed(conn, changeset)
    end
  end
end