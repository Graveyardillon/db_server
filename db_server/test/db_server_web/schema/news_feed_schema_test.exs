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

    @update_params %{
      text: "Rock is dead."
    }

    @insert_game_params %{
      name: "test_name"
    }

    test "crud test." do
      # You have to create a game at first.
      assert {_, game_struct} = Games.create(@insert_game_params)
      assert {_, news_feed_struct} = NewsFeeds.create(@insert_params, game_struct)
      assert %NewsFeed{} = news_feed = NewsFeeds.get(news_feed_struct.id)
      assert {:ok, %NewsFeed{} = news_feed} = NewsFeeds.update(news_feed, @update_params)
      assert {:ok, %NewsFeed{} = news_feed} = NewsFeeds.delete(news_feed)
    end
  end
end