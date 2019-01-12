defmodule RiftExTest.ChampionMastery do
  import RiftEx.ChampionMastery

  use RiftEx.CassetteCase, async: false

  test "get_all_champion_masteries_by_summoner_id", ctx do
    use_cassette "champion_masteries#masteries_by_summoner_id" do
      response = get_all_champion_masteries_by_summoner_id(ctx.client, ctx.summoner_id)
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/champion-mastery/v4/champion-masteries/by-summoner/#{ctx.summoner_id}")
    end
  end

  test "get_champion_mastery_by_summoner_id", ctx do
    use_cassette "champion_masteries#mastery_by_summoner_id" do
      response = get_champion_mastery_by_summoner_id(ctx.client, ctx.summoner_id, 68)
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/champion-mastery/v4/champion-masteries/by-summoner/#{ctx.summoner_id}/by-champion/68")
    end
  end

  test "get_scores_by_summoner_id", ctx do
    use_cassette "champion_masteries#scores_by_summoner_id" do
      response = get_scores_by_summoner_id(ctx.client, ctx.summoner_id)
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/champion-mastery/v4/scores/by-summoner/#{ctx.summoner_id}")
    end
  end

end
