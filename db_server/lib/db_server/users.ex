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
end