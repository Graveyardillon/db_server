defmodule DbServerWeb.GameControllerTest do
  use DbServerWeb.ConnCase
  use DbServer.AroundRepo

  setup do
    %{
      game: create_game(
        name: "test_one"
      )
    }
  end

  test "create game" do
    
  end
end