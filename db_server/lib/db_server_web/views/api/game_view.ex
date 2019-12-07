defmodule DbServerWeb.API.GameView do
  use DbServerWeb, :view

  def render("index." <> _format, _assigns) do
    %{
      data: "Successed!"
    }
  end

  def render(:create, struct) do
    %{
      status: "created",
      data: struct
    }
  end
end