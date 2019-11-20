defmodule DbServerWeb.GameSchemaTest do
  use ExUnit.Case, async: true
  use DbServer.DataCase

  alias DbServer.Games
  alias DbServer.Schema.Game

  describe "crud test." do
    @insert_params %{game_name: "test_name"}

    test "get a row from a table with a valid data." do
      {_, struct} = Games.create_game(@insert_params)
      assert %Game{} = game = Games.get_game(struct.id)
      assert {:ok, %Game{} = game} = Games.delete_game(game)
    end
  end
end