defmodule DbServerWeb.GameSchemaTest do
  use ExUnit.Case, async: true
  use DbServer.DataCase

  alias DbServer.Games
  alias DbServer.Schema.Game

  describe "game schema test." do
    @insert_params %{game_name: "test_name"}

    test "crud test." do
      assert {_, struct} = Games.create_game(@insert_params)
      assert %Game{} = game = Games.get_game(struct.id)
      assert {:ok, %Game{} = game} = Games.update_game(game, %{:game_name => "updated_one"})
      assert {:ok, %Game{} = game} = Games.delete_game(game)
    end
  end
end