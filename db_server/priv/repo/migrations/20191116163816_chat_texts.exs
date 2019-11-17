defmodule DbServer.Repo.Migrations.ChatTexts do
  use Ecto.Migration

  def change do
  # this table needs a sort occationally.
    create table(:chat_texts, primary_key: false) do
      add :chat_id, :id, primary_key: true
      add :tournament_id, references(:tournaments, type: :id, column: :tournament_id)
      add :chat_text, :string
      add :chat_sender_id, references(:users, type: :string, column: :user_id)
      add :chat_recipient_id, references(:users, type: :string, column: :user_id)

      timestamps()
    end
  end
end
