defmodule DbServer.AroundRepo do
  defmacro __using__(_opts) do
    quote do
      import Ecto.Query, warn: false
      import Ecto

      use DbServer.SchemaShared

      alias DbServer.Repo
      alias DbServer.RepoFunctions.{
        Games,
        Tournaments,
        Users,
        ParticipatingTeams,
        NewsFeeds, 
        ChatTexts,
        Wins
      }
    end
  end
end