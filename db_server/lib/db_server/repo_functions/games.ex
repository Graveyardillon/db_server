defmodule DbServer.RepoFunctions.Games do
  @moduledoc """
    The games context.
  """
  use DbServer.AroundRepo

  def create(params \\ :empty) do
    %Game{}
    |> Game.changeset(params)
    |> Repo.insert()
  end

  def update(game, params) do
    game
    |> Game.changeset(params)
    |> Repo.update()
  end

  def delete(game \\ %{}) do
    Repo.delete(game)
  end

  def get(id \\ :empty) do
    Repo.get!(Game, id)
  end
end