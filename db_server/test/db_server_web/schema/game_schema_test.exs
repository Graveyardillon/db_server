defmodule DbServerWeb.GameSchemaTest do
  use ExUnit.Case, async: true
  use DbServer.DataCase
  use DbServer.AroundRepo

  describe "game schema test." do
    @insert_params %{name: "test_name"}
    @update_params %{name: "updated_one"}

    test "crud test." do
      assert {_, struct} = Games.create(@insert_params)
      assert %Game{} = game = Games.get(struct.id)
      assert @insert_params.name == game.name
      assert {:ok, %Game{} = game} = Games.update(game, @update_params)
      assert @update_params.name == game.name
      assert {:ok, %Game{} = game} = Games.delete(game)
    end
  end
end