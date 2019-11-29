defmodule DbServerWeb.NewsFeedSchemaTest do
  use ExUnit.Case, async: true

  use DbServer.DataCase
  use DbServer.AroundRepo

  # The news feed is addressed by only admins.
  describe "news feed schema test." do
    @insert_params %{
      title: "test_title",
      image_path: "~/Documents",
      text: "This is a new shit"
    }

    @insert_game_params %{
      name: "test_name"
    }

    test "crud test." do
      # You have to create a game at first.
      assert {_, game_struct} = Games.create_game(@insert_game_params)
      assert {_, news_feed_struct} = NewsFeeds.create_news_feed(@insert_params, game_struct)
      assert %NewsFeed{} = news_feed = NewsFeeds.get_news_feed(news_feed_struct.id)
    end
  end
end