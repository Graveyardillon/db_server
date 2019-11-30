defmodule DbServer.Repo.Migrations.CreateRecipientsChatTexts do
  use Ecto.Migration

  def change do
    create table(:recipients_chat_texts) do
      add :user_id, references(:users, type: :string), on_delete: :delete_all
      add :chat_text_id, references(:chat_texts), on_delete: :delete_all
    end
  end
end
