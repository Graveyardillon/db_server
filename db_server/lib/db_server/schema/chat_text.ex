defmodule DbServer.Schema.ChatText do
  use DbServer.AroundSchema

  schema "chat_texts" do
    field :text, :string
    
    belongs_to :tournament, Tournament
    many_to_many :sender, User, join_through: "senders_chat_texts", on_delete: :delete_all
    many_to_many :recipient, User, join_through: "recipients_chat_texts", on_delete: :delete_all

    timestamps()
  end

  @text_regex ~r/\S/

  @doc false
  def changeset(chat_text, params \\ :empty) do
    chat_text
    |> cast(params, [:tournament, :text, :sender, :recipient])
    |> validate_format(:text, @text_regex)
  end

  @doc false
  def put_assoc_sender(chat_text, %User{} = user) do
    chat_text
    |> change()
    |> put_assoc(:sender, [user])
    |> foreign_key_constraint(:sender)
  end

  @doc false
  def put_assoc_recipient(chat_text, %User{} = user) do
    chat_text
    |> change()
    |> put_assoc(:recipient, [user])
    |> foreign_key_constraint(:recipient)
  end
end