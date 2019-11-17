Ecto.Adapters.SQL.Sandbox.mode(DbServer.Repo, :manual)

defmodule DbServerWeb.GameSchemaTest do
  use ExUnit.Case, async: true

  alias DbServer.Games

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(DbServer.Repo)
  end

  test "testA" do
      assert Games.test() == 1
  end
end