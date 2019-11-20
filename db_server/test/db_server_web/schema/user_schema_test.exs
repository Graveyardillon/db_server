defmodule DbServerWeb.UserSchemaTest do
  use ExUnit.Case, async: true
  use DbServer.DataCase

  alias DbServer.Users
  alias DbServer.Schema.User

  describe "user schema test." do
    @insert_params %{
      user_id: "test_id",
      user_name: "test_name",
      user_email: "email@gmail.com",
      user_password: "Password123?",
      user_gender: 0,
      user_bio: "Howdy?",
      user_birthday: DateTime.utc_now()
    }

    @update_params %{
      user_email: "updated@gmail.com"
    }

    test "crud test." do
      assert {_, struct} = Users.create_user(@insert_params)
      assert %User{} = user = Users.get_user(struct.user_id)
      assert {:ok, %User{} = user} = Users.update_user(user, @update_params)
    end
  end
end