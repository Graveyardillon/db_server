defmodule DbServerWeb.API.NewsFeedView do
  use DbServerWeb, :view

  def render("index." <> _format, _assigns) do
    %{
      data: "Successed!"
    }
  end
end