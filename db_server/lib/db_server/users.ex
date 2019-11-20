defmodule DbServer.Users do
  @moduledoc """
    The users context.
  """
  import Ecto.Query, warn: false

  alias DbServer.Repo
  alias DbServer.Schema.User

  def create_user(user \\ %{}) do
    %User{}
    |> User.changeset(user)
    |> Repo.insert()
  end

  def update_user(user \\ %{}, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
  end

  def delete_user(user \\ %{}) do
    Repo.delete(user)
  end

  def get_user(id \\ :empty) do
    Repo.get!(User, id)
  end
end