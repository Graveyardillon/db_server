defmodule DbServer.Case do
  @moduledoc """
  This module maintains functions for tests.
  """

  use DbServer.AroundRepo
  #import ExUnit.Callbacks

  def create_game(name) do
    %Game{}
    |> Game.changeset(name)
    |> DbServer.Repo.insert()
  end
end