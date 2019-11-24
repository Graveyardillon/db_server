defmodule DbServer.Repo.Migrations.CreateChatTexts do
  use Ecto.Migration

  def change do
  # this table needs a sort occationally.
    create table(:chat_texts) do
      add :tournament_id, references(:tournaments)
      add :text, :string
      add :sender_id, references(:users, type: :string, column: :id)
      add :recipient_id, references(:users, type: :string, column: :id)

      timestamps()
    end
  end
end
