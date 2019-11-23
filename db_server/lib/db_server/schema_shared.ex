defmodule DbServer.SchemaShared do
  defmacro __using__(_opts) do
    quote do
      alias DbServer.Schema.{
        ChatText,
        Game,
        NewsFeed,
        ParticipatingTeam,
        Tournament,
        User,
        Win
      }
    end
  end
end