defmodule RiotApiClientTest.ChampionMastery do
  import RiotApiClient.ChampionMastery

  use RiotApiClient.CassetteCase, async: false

  setup do
    ExVCR.Config.filter_sensitive_data("3873121536", "999")
    :ok
  end

  test "get_all_champion_masteries_by_summoner_id", ctx do
    use_cassette "masteries_by_summoner_id" do
      response = get_all_champion_masteries_by_summoner_id(ctx.client, ctx.summoner_id)
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/champion-mastery/v4/champion-masteries/by-summoner/#{ctx.summoner_id}")
    end
  end

  test "get_champion_mastery_by_summoner_id", ctx do
    use_cassette "mastery_by_summoner_id" do
      response = get_champion_mastery_by_summoner_id(ctx.client, ctx.summoner_id, 68)
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/champion-mastery/v4/champion-masteries/by-summoner/#{ctx.summoner_id}/by-champion/68")
    end
  end

end
