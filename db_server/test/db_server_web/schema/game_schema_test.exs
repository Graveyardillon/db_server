Ecto.Adapters.SQL.Sandbox.mode(DbServer.Repo, :manual)

defmodule DbServerWeb.GameSchemaTest do
  use ExUnit.Case, async: true

  alias DbServer.Games

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(DbServer.Repo)
  end

  test "insertion" do
    map = %{"game_name" => "test_name"}

    assert Games.create_game(map) == {:ok, "test_name"}
  end
end