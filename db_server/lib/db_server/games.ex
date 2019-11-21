defmodule DbServer.Games do
  @moduledoc """
    The games context.
  """
  import Ecto.Query, warn: false
  
  alias DbServer.Repo
  alias DbServer.Schema.Game

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