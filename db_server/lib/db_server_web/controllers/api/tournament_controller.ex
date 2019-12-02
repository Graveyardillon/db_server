defmodule DbServerWeb.API.TournamentController do
  use DbServerWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end