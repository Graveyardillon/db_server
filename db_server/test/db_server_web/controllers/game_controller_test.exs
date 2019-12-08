defmodule DbServerWeb.GameControllerTest do
  use DbServerWeb.ConnCase
  use DbServer.AroundRepo

  setup do
    %{
      game: create_game(
        %{name: "test_one"}
      )
    }
  end

  test "create game", set do
    {:ok, result} = set.game

    conn = 
      build_conn()
      |> post("game/create", result |> Map.from_struct())
      |> json_response(200)
      
    #assert conn.status == 204
  end
end