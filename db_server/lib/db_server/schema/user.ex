defmodule DbServer.Schema.User do
  use DbServer.AroundSchema

  alias Comeonin.Bcrypt

  @primary_key {:id, :string, []}

  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string
    field :gender, :integer
    field :bio, :string
    field :birthday, :utc_datetime
    field :hosting_experience, :integer, default: 0

    many_to_many :game, Game, join_through: "games_users", on_delete: :delete_all
    many_to_many :participating_team, ParticipatingTeam, join_through: "participating_teams_users", on_delete: :delete_all

    has_one :tournament, Tournament

    timestamps()
  end

  @name_regex ~r"^[a-z0-9_\-\.]+$"
  @email_regex ~r/@/

  @doc false
  def changeset(user, params \\ :empty) do
    user
    |> cast(params, [:id, :name, :email, :password, :gender, :bio, :birthday, :hosting_experience])
    |> validate_required([:id, :name, :email, :password, :gender, :bio, :birthday, :hosting_experience])
    |> unique_constraint(:id, message: "The id has been already taken.")
    |> validate_length(:name, min: 3)
    |> validate_format(:name, @name_regex)
    |> unique_constraint(:email, message: "The email already exists.")
    |> validate_format(:email, @email_regex, message: "Invalid format.")
    |> validate_length(:password, min: 8, max: 20)
    |> validate_format(:password, ~r/[A-Z]+/, message: "Password must contain an upper-case letter.")
    |> validate_format(:password, ~r/[a-z]+/, message: "Password must contain a lower-case letter.")
    |> validate_format(:password, ~r/[0-9]+/, message: "Password must contain a number.")
    |> validate_format(:password, ~r/[#\!\?&@\$%^&*\(\)]+/, message: "Password must contain a symbol.")
    |> validate_confirmation(:password, message: "Does not match password.")
    |> put_pass_hash()
    |> validate_length(:bio, max: 125)
  end

  @doc false
  def put_assoc(user, %Game{} = game) do
    user
    |> change()
    |> put_assoc(:game, [game])
    |> foreign_key_constraint(:game)
  end

  @doc false
  def build_assoc(user, %Tournament{} = tournament) do
    user
    |> change()
    |> build_assoc(:tournament, [tournament])
    |> foreign_key_constraint(:tournament)
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Bcrypt.hashpwsalt(password))
  end
  defp put_pass_hash(changeset), do: changeset
end