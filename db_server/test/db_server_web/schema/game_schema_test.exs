defmodule DbServerWeb.GameSchemaTest do
  use ExUnit.Case, async: true
  use DbServer.DataCase

  alias DbServer.Games
  alias DbServer.Schema.Game

  describe "insertion" do
    @valid_params %{game_name: "test_name"}
    @invalid_params %{game_name: nil}

  test "insertion" do
    assert {:ok, %Game{} = game} = Games.create_game(@valid_params)
  end
end