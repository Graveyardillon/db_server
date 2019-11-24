defmodule DbServer.RepoFunctions.Games do
  @moduledoc """
    The games context.
  """
  use DbServer.AroundRepo

  def create_game(game \\ %{}) do
    %Game{}
    |> Game.changeset(game)
    |> Repo.insert()
  end

  def update_game(game \\ %{}, params) do
    game
    |> Game.changeset(params)
    |> Repo.update()
  end

  def delete_game(game \\ %{}) do
    Repo.delete(game)
  end

  def get_game(id \\ %{}) do
    Repo.get!(Game, id)
  end
end