defmodule DbServerWeb.API.TournamentView do
  use DbServerWeb, :view

  def render("index." <> _format, _assigns) do
    %{
      data: "Successed!"
    }
  end
end