defmodule DbServer.RepoFunctions.Wins do
  @moduledoc """
    The wins context.
  """
  use DbServer.AroundRepo

  def create(params \\ %{}, user) do
    %Win{}
    |> Win.changeset(params)
    |> add_user_relation(user)
    |> Repo.insert()
  end

  # Except for CRUD.
  defp add_user_relation(win, user) do
    user
    |> User.build_win_assoc(win.changes)
  end
end