defmodule DbServerWeb.RequestView do
  use DbServerWeb, :view

  def render("index." <> _format, _assigns) do
    %{
      data: "successed!"
    }
  end
end