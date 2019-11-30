defmodule DbServer.RepoFunctions.ChatTexts do
  @moduledoc """
    The chat texts context.
  """
  use DbServer.AroundRepo

  def create(params, %User{} = sender, %User{} = recipient) do
    %ChatText{}
    |> ChatText.changeset(params)
    |> ChatText.put_assoc_sender(sender)
    |> ChatText.put_assoc_recipient(recipient)
    |> Repo.insert()
  end

  def update(chat_text, params) do
    chat_text
    |> ChatText.changeset(params)
    |> Repo.update()
  end

  def get(id) do
    Repo.get!(ChatText, id)
  end
end