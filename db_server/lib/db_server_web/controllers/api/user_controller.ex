defmodule DbServerWeb.API.UserController do
  use DbServerWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end