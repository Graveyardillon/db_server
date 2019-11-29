defmodule DbServer.RepoFunctions.NewsFeeds do
  @moduledoc """
    The news feeds context.
  """
  use DbServer.AroundRepo

  def create_news_feed(params \\ :empty, %Game{} = game) do
    %NewsFeed{}
    |> NewsFeed.changeset(params)
    |> add_game_relation(game)
    |> Repo.insert()
  end

  def update_news_feed(news_feed, params) do
    news_feed
    |> NewsFeed.changeset(params)
    |> Repo.update()
  end

  def get_news_feed(id) do
    Repo.get!(NewsFeed, id)
  end

  # Except for CRUD.
  defp add_game_relation(news_feed, game) do
    game
    |> Game.build_assoc(news_feed)
  end
end