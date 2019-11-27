defmodule DbServerWeb.ParticipatingTeamSchemaTest do
  use ExUnit.Case, async: true
  use DbServer.DataCase
  use DbServer.AroundRepo

  describe "participating team schema test." do
    @insert_tournament_params %{
      name: "test_name",
      duration: 120,
      participation_deadline: DateTime.utc_now(),
      team_number_limit: 2,
      player_number_limit: 2
    }

    test "team creation and adding member test." do
      assert {_, tournament_struct} = Tournaments.create_tournament(@insert_tournament_params)
      assert {_, participating_team_struct} = ParticipatingTeams.create_participating_team(tournament_struct)

      # get the tourney.
      assert %ParticipatingTeam{} = participating_team = ParticipatingTeams.get_participating_team(participating_team_struct.id)
    end
  end
end