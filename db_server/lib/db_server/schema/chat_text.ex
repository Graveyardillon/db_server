defmodule DbServer.Schema.ChatText do
  use DbServer.AroundSchema

  schema "chat_texts" do
    belongs_to :tournament, Tournament
    field :text, :string
    belongs_to :sender, User, foreign_key: :sender_id
    belongs_to :recipient, User, foreign_key: :recipient_id

    timestamps()
  end
end