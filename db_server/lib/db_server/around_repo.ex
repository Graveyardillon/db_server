defmodule DbServer.AroundRepo do
  defmacro __using__(_opts) do
    quote do
      import Ecto.Query, warn: false
      import Ecto

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
        Users,
        ParticipatingTeams
      }
    end
  end
end