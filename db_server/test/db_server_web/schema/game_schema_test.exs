defmodule DbServerWeb.GameSchemaTest do
  use ExUnit.Case, async: true
  use DbServer.DataCase

  alias DbServer.Games
  alias DbServer.Schema.Game

  describe "insertion" do
    @valid_params %{game_name: "test_name"}
    @invalid_params %{game_name: nil}

    test "insertion with valid data" do
      assert {:ok, %Game{} = game} = Games.create_game(@valid_params)
      assert game.game_name == "test_name"
    end

    test "insertion with invalid data" do
      assert {:error, %Ecto.Changeset{}} = Games.create_game(@invalid_params)
    end
  end

  describe "deletion" do
    @valid_params %{game_name: "tset_name"}

    test "deletion with valid data" do
      assert {:ok, %Game{} = game} = Games.delete_game(@valid_params)
    end

    test "deletion with invalid data" do
    
    end
  end

  describe "update" do
    test "update with valid data" do
    
    end

    test "update with invalid data" do
      
    end
  end
end