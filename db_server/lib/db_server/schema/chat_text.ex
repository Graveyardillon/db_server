defmodule DbServer.Schema.ChatText do
  use DbServer.AroundSchema

  schema "chat_texts" do
    belongs_to :tournament, Tournament
    field :text, :string
    belongs_to :sender, User, foreign_key: :sender_id
    belongs_to :recipient, User, foreign_key: :recipient_id

    timestamps()
  end

  @text_regex ~r/\S/

  @doc false
  def changeset(chat_text, params \\ :empty) do
    chat_text
    |> cast(params, [:tournament, :text, :sender, :recipient])
    |> validate_format(:text, @text_regex)
  end
end