defmodule DbServer.Games do
  @moduledoc """
    The games context.
  """
  import Ecto.Query, warn: false
  
  alias DbServer.Repo
  alias DbServer.Schema.Game

  def create_game(params \\ %{}) do
    case params do
      %{game_name: game_name} ->

        %Game{}
        |> Game.changeset(params)
        |> Repo.insert()
      
      _ ->
        {:error, "Invalid format."}
    end
  end

  def delete_game(game \\ %{}) do
    Repo.delete(game)
  end

  def get_game(id \\ %{}) do
    Repo.get!(Game, id)
  end
end