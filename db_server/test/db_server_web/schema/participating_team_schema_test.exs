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

    @insert_user_params %{
      id: "test_id",
      name: "test_name",
      email: "email@gmail.com",
      password: "Password123?",
      gender: 0,
      bio: "Howdy?",
      birthday: DateTime.utc_now()
    }

    @update_user_params %{
      name: "new_one"
    }

    test "team creation and adding member test." do
      assert {_, tournament_struct} = Tournaments.create(@insert_tournament_params)
      assert {_, participating_team_struct} = ParticipatingTeams.create(tournament_struct)

      # get the tourney.
      assert %ParticipatingTeam{} = participating_team = ParticipatingTeams.get(participating_team_struct.id)
      assert {_, user_struct} = Users.create(@insert_user_params)
      assert {:ok, %ParticipatingTeam{} = participating_team} = ParticipatingTeams.add_member_relation(participating_team, user_struct)
                                                                |> ParticipatingTeams.update()
      participating_team.user
      |> Enum.each(fn x ->
           assert x.id == @insert_user_params.id
           assert {:ok, %User{} = user} = Users.update(x, @update_user_params)
         end)
      
      assert %ParticipatingTeam{} = participating_team = ParticipatingTeams.get(participating_team_struct.id)

      participating_team.user
      |> Enum.each(fn x ->
           assert x.name == @update_user_params.name
         end)
    end
  end
end