defmodule DbServer.RepoFunctions.Users do
  @moduledoc """
    The users context.
  """
  use DbServer.AroundRepo

  def create(params \\ :empty) do
    %User{}
    |> User.changeset(params)
    |> Repo.insert()
  end

  def update(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
  end

  def delete(user) do
    Repo.delete(user)
  end

  def get(id) do
    Repo.get!(User, id)
  end

  # Except for CRUD.

  def add_game_relation(user, game \\ %{}) do
    user
    |> Repo.preload([:games])
    |> User.put_assoc(game)
  end

  def update(changeset) do
    changeset
    |> Repo.update()
  end

  def add_tournament_relation(user, %Tournament{} = tournament) do
    user
    |> User.build_tournament_assoc(tournament)
  end
end