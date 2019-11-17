defmodule DbServer.User do
  use Ecto.Schema

  @primary_key {:user_id, :id, auto_generate: true}

  schema "users" do
    field :user_name, :string
    field :user_email, :string
    field :user_password, :string
    field :user_gender, :integer
    field :user_bio, :string
    field :user_birthday, :utc_datetime
    field :user_hosting_experience, :integer
    #belongs_to

    timestamps()
  end
end