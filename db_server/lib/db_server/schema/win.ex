defmodule DbServer.Schema.Win do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:win_id, :id, autogenerate: true}

  schema "wins" do
    field :win_count, :integer, default: 0

    timestamps()

    belongs_to :user_id, DbServer.Schema.User, references: :user_id, type: :string
    belongs_to :tournament_id, DbServer.Schema.Tournament, references: :tournament_id, type: :id
  end

  def changeset(win, params \\ :empty) do
    win
    |> cast(params, [:win_count])
    |> validate_required([:win_count])
  end
end