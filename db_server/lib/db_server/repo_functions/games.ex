defmodule DbServer.RepoFunctions.Games do
  @moduledoc """
    The games context.
  """
  use DbServer.AroundRepo

  def create_game(params \\ :empty) do
    %Game{}
    |> Game.changeset(params)
    |> Repo.insert()
  end

  def update_game(game, params) do
    game
    |> Game.changeset(params)
    |> Repo.update()
  end

  def delete_game(game \\ %{}) do
    Repo.delete(game)
  end

  def get_game(id \\ :empty) do
    Repo.get!(Game, id)
  end
end