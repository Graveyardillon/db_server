defmodule DbServer.Tournaments do
  @moduledoc """
    The tournaments context.
  """
  import Ecto.Query

  alias DbServer.Repo
  alias DbServer.Schema.Tournament

  def create_tournament(tournament \\ %{}) do
    %Tournament{}
    |> Tournament.changeset(tournament)
    |> Repo.insert()
  end
end