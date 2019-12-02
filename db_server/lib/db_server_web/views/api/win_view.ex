defmodule DbServerWeb.API.WinView do
  use DbServerWeb, :view

  def render("index." <> _format, _assigns) do
    %{
      data: "Successed!"
    }
  end
end