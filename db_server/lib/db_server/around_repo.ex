defmodule DbServer.AroundRepo do
  defmacro __using__(_opts) do
    quote do
      import Ecto.Query, warn: false

      alias DbServer.Repo
      alias DbServer.Schema.{
        ChatText,
        Game,
        NewsFeed,
        ParticipatingTeam,
        Tournament,
        User,
        Win
      }

      alias DbServer.RepoFunctions.{
        Games,
        Tournaments,
        Users
      }
    end
  end
end