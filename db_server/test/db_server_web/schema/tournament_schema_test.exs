defmodule DbServerWeb.TournamentSchemaTest do
  use ExUnit.Case, async: true
  # XXX: I dunno why I'm using DbServer.DataCase
  use DbServer.DataCase
  use DbServer.AroundRepo

  describe "tournament schema test." do
    @insert_params %{
      name: "test_name",
      duration: 120,
      participation_deadline: DateTime.utc_now(),
      team_number_limit: 2,
      player_number_limit: 2
    }

    @update_params %{
      name: "updated_one"
    }

    @invalid_insert_params %{
      name: nil,
      duration: 120,
      participation_deadline: DateTime.utc_now(),
      team_number_limit: 2,
      player_number_limit: 2
    }

    @invalid_update_params %{
      duration: nil
    }

    test "crud test." do
      assert {_, struct} = Tournaments.create_tournament(@insert_params)
      assert %Tournament{} = tournament = Tournaments.get_tournament(struct.id)
      assert {:ok, %Tournament{} = tournament} = Tournaments.update_tournament(tournament, @update_params)
      assert {:ok, %Tournament{} = tournament} = Tournaments.delete_tournament(tournament)
    end

    test "invalid cru test." do
      assert {:error, struct} = Tournaments.create_tournament(@invalid_insert_params)
      assert {_, struct} = Tournaments.create_tournament(@insert_params)
      assert %Tournament{} = tournament = Tournaments.get_tournament(struct.id)
      assert {:error, %Ecto.Changeset{} = tournament} = Tournaments.update_tournament(tournament, @invalid_update_params)
    end

    test "adding relation test." do
      assert {_, struct} = Tournaments.create_tournament(@insert_params)
      
    end
  end
end