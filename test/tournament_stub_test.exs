defmodule RiftExTest.TournamentStub do
  import RiftEx.TournamentStub
  alias RiftEx.Client
  use RiftEx.CassetteCase, async: false

  @americas_endpoint "https://americas.api.riotgames.com"
  setup_all ctx do
    [
      client: %Client{
        ctx.client | endpoint: @americas_endpoint <> "/"
      }
    ]
  end

  test "get_codes", ctx do
    use_cassette "tournament-stub#codes" do
      response = get_codes(ctx.client, %{
        "mapType" => "HOWLING_ABYSS",
        "pickType" => "ALL_RANDOM",
        "spectatorType" => "ALL",
        "teamSize" => 5
      }, %{"tournamentId" => 5423})
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/tournament-stub/v4/codes?tournamentId=5423", @americas_endpoint)
    end
  end

  test "get_lobby_events_by_code", ctx do
    use_cassette "tournament-stub#lobby-events" do
      response = get_lobby_events_by_code(ctx.client, 5423)
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/tournament-stub/v4/lobby-events/by-code/5423", @americas_endpoint)
    end
  end

  test "get_providers", ctx do
    use_cassette "tournament-stub#providers" do
      response = get_providers(ctx.client, %{
        "region" => "EUW",
        "url" => "https://example.com"
      })
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/tournament-stub/v4/providers", @americas_endpoint)
    end
  end

  test "get_tournaments", ctx do
    use_cassette "tournament-stub#tournaments" do
      response = get_tournaments(ctx.client, %{
        "providerId" => "593",
      })
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/tournament-stub/v4/tournaments", @americas_endpoint)
    end
  end

  # test "get_codes", ctx do
  #   use_cassette "tournament-stub#providers" do
  #     response = get_providers(ctx.americas_client, %{
  #       "mapType" => "HOWLING_ABYSS",
  #       "pickType" => "ALL_RANDOM",
  #       "spectatorType" => "ALL",
  #       "teamSize" => 5
  #     }, %{"tournamentId" => 5423})
  #     assert response.status_code == 200
  #     assert response.request_url == join_endpoint("/lol/tournament-stub/v4/codes")
  #   end
  # end

end
