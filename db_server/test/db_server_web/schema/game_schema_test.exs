defmodule DbServerWeb.GameSchemaTest do
  use ExUnit.Case, async: true
  use DbServer.DataCase
  use DbServer.AroundRepo

  describe "game schema test." do
    @insert_params %{name: "test_name"}
    @update_params %{name: "updated_one"}

    test "crud test." do
      assert {_, struct} = Games.create_game(@insert_params)
      assert %Game{} = game = Games.get_game(struct.id)
      assert {:ok, %Game{} = game} = Games.update_game(game, @update_params)
      assert {:ok, %Game{} = game} = Games.delete_game(game)
    end
  end
end