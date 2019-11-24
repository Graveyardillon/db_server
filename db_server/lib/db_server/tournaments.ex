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

  def update_tournament(tournament \\ %{}, params) do
    tournament
    |> Tournament.changeset(params)
    |> Repo.update()
  end

  def delete_tournament(tournament \\ %{}) do
    Repo.delete(tournament)
  end

  def get_tournament(id \\ :empty) do
    Repo.get!(Tournament, id)
  end

  # Except for CRUD.
end