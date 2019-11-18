defmodule DbServerWeb.GameSchemaTest do
  use ExUnit.Case, async: true
  use DbServer.DataCase

  alias DbServer.Games
  alias DbServer.Schema.Game

  @valid_params %{game_name: "test_name"}

  test "insertion" do
    assert {:ok, %Game{} = game} = Games.create_game(@valid_params)
  end
end