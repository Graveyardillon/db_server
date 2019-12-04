defmodule DbServer.Schema.Win do
  use DbServer.AroundSchema

  schema "wins" do
    field :win_count, :integer, default: 0

    timestamps()

    belongs_to :user, User, references: :id, type: :string
    belongs_to :tournament, Tournament
  end

  def changeset(win, params \\ :empty) do
    win
    |> cast(params, [:win_count])
  end
end