defmodule DbServerWeb.API.WinController do
  use DbServerWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end