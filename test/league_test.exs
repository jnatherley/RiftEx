defmodule RiotApiClientTest.League do
  # import RiotApiClient.League
  import RiotApiClient.League

  use RiotApiClient.CassetteCase, async: false

  @queue "RANKED_SOLO_5x5"

  setup do
    ExVCR.Config.filter_sensitive_data("3873121536", "999")
    :ok
  end

  test "get_league_by_id", ctx do
    use_cassette "league#by_id" do
      response = get_league_by_id(ctx.client, "ae51cf10-890c-11e8-afc2-c81f66dacb22")
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/league/v4/leagues/ae51cf10-890c-11e8-afc2-c81f66dacb22")

    end
  end

  test "get_challenger_leagues_by_queue", ctx do
    use_cassette "league#challengers_leagues" do
      response = get_challenger_leagues_by_queue(ctx.client, @queue)
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/league/v4/challengerleagues/by-queue/#{@queue}")
      refute response.request_url == join_endpoint("/lol/league/v3/challengerleagues/by-queue/#{@queue}")
    end
  end

  test "get_grandmaster_leagues_by_queue", ctx do
    use_cassette "league#grandmaster_leagues" do
      response = get_grandmaster_leagues_by_queue(ctx.client, @queue)
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/league/v4/grandmasterleagues/by-queue/#{@queue}")
    end
  end

  test "get_master_leagues_by_queue", ctx do
    use_cassette "league#master_leagues" do
      response = get_master_leagues_by_queue(ctx.client, @queue)
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/league/v4/masterleagues/by-queue/#{@queue}")
    end
  end

  test "get_summoner_positions_by_id", ctx do
    use_cassette "league#summoner_positions_by_id" do
      response = get_summoner_positions_by_id(ctx.client, ctx.summoner_id)
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/league/v4/positions/by-summoner/#{ctx.summoner_id}")
    end
  end

end
