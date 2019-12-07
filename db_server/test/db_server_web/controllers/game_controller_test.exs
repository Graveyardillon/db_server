defmodule DbServerWeb.GameControllerTest do
  use DbServerWeb.ConnCase

  test "/game", %{conn: conn} do
    games = [
      %{
        name: "test1"
      },
      %{
        name: "test2"
      }
    ]

    [{:ok, game1}, {:ok, game2}] = Enum.map(games, &Games.create(&1))

    response =
      conn
      |> post(Routes.game_path(conn, :create))
      |> json_response(200)
  end
end