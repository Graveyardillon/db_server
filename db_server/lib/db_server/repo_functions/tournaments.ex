defmodule DbServer.RepoFunctions.Tournaments do
  @moduledoc """
    The tournaments context.
  """
  use DbServer.AroundRepo

  def create(params, %Game{} = game) do
    %Tournament{}
    |> Tournament.changeset(params)
    |> add_game_relation(game)
    |> Repo.insert()
  end

  def create(params) do
    %Tournament{}
    |> Tournament.changeset(params)
    |> Repo.insert()
  end

  def update(tournament \\ %{}, params) do
    tournament
    |> Tournament.changeset(params)
    |> Repo.update()
  end

  def delete(tournament \\ %{}) do
    Repo.delete(tournament)
  end

  def get(id \\ :empty) do
    Repo.get!(Tournament, id)
  end

  # Except for CRUD.
  defp add_game_relation(tournament, game) do
    game
    |> Game.build_tournament_assoc(tournament.changes)
  end
end