defmodule DbServerWeb.UserSchemaTest do
  use ExUnit.Case, async: true
  use DbServer.DataCase
  use DbServer.AroundRepo

  describe "user schema test." do
    @insert_params %{
      id: "test_id",
      name: "test_name",
      email: "email@gmail.com",
      password: "Password123?",
      gender: 0,
      bio: "Howdy?",
      birthday: DateTime.utc_now()
    }

    @update_params %{
      email: "updated@gmail.com"
    }

    @insert_game_params %{
      name: "test_name"
    }

    test "crud test." do
      assert {_, struct} = Users.create_user(@insert_params)
      assert %User{} = user = Users.get_user(struct.id)
      assert {:ok, %User{} = user} = Users.update_user(user, @update_params)
      assert {:ok, %User{} = user} = Users.delete_user(user)
    end

    test "adding relation test." do
      {_, user_struct} = Users.create_user(@insert_params)
      {_, game_struct} = Games.create_game(@insert_game_params)
      assert {:ok, %User{} = user} = Users.add_game_relation(user_struct, game_struct)
                                     |> Users.update_user()
      assert {:ok, %User{} = user} = Users.delete_user(user)
    end
  end
end