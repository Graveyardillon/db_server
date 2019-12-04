defmodule DbServerWeb.WinSchemaTest do
  use ExUnit.Case, async: true
  use DbServer.DataCase
  use DbServer.AroundRepo

  describe "win schema test." do
    @insert_user_params %{
      id: "test_id",
      name: "test_name",
      email: "test@gmail.com",
      password: "Password123?",
      gender: 0,
      bio: "Howdy?",
      birthday: DateTime.utc_now()
    }

    test "crud test." do
      assert {_, user_struct} = Users.create(@insert_user_params)
      #assert {_, win_struct} = Wins.create(user_struct)
    end
  end
end