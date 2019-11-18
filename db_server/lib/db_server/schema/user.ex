defmodule DbServer.Schema.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Comeonin.Bcrypt

  @primary_key {:user_id, :string, []}

  schema "users" do
    field :user_name, :string
    field :user_email, :string
    field :user_password, :string
    field :user_gender, :integer
    field :user_bio, :string
    field :user_birthday, :utc_datetime
    field :user_hosting_experience, :integer, default: 0

    belongs_to :following_games, DbServer.Schema.Game, references: :game_id, type: :id

    has_one :tournament, DbServer.Schema.Tournament

    timestamps()
  end

  @user_name_regex ~r"^[a-z0-9_\-\.]+$"
  @email_regex ~r/@/

  @doc false
  def changeset(user, params \\ :empty) do
    user
    |> cast(params, [:user_id, :user_name, :user_email, :user_password, :user_gender, :user_bio, :user_birthday, :user_hosting_experience, :following_games])
    |> validate_required([:user_id, :user_name, :user_email, :user_password, :user_gender, :user_bio, :user_birthday, :user_hosting_experience, :following_games])
    |> validate_length(:user_name, min: 3)
    |> validate_format(:user_name, @user_name_regex)
    |> unique_constraint([:user_id, :user_email], "The email already exists.")
    |> validate_format(:email, @email_regex, message: "Invalid format.")
    |> validate_length(:password, min: 8, max: 20)
    |> validate_format(:password, ~r/[A-Z]+/, message: "Password must contain an upper-case letter.")
    |> validate_format(:password, ~r/[a-z]+/, message: "Password must contain a lower-case letter.")
    |> validate_format(:password, ~r/[0-9]+/, message: "Password must contain a number.")
    |> validate_format(:password, ~r/[#\!\?&@\$%^&*\(\)]+/, message: "Password must contain a symbol.")
    |> validate_confirmation(:password, message: "Does not match password.")
    |> put_pass_hash()
    |> validate_length(:user_bio, max: 125)
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Bcrypt.hashpwsalt(password))
  end
  defp put_pass_hash(changeset), do: changeset
end