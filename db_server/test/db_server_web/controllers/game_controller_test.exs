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

    assert conn = build_conn(:post, "/api/create", result)
      
    #assert conn.status == 204
  end
end