defmodule RiftExTest.Summoner do
  alias RiftEx.Summoner.{V4}
  use RiftEx.CassetteCase, async: false

  test "get_summoner_by_account_id", ctx do
    use_cassette "summoner#by_account_id" do
      response = V4.get_summoner_by_account_id(ctx.client, ctx.account_id)
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/summoner/v4/summoners/by-account/#{ctx.account_id}")
    end
  end

  test "get_summoner_by_name", ctx do
    use_cassette "summoner#by_name" do
      response = V4.get_summoner_by_name(ctx.client, ctx.account_name)
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/summoner/v4/summoners/by-name/#{ctx.account_name}")
    end
  end

  test "get_summoner_by_id", ctx do
    use_cassette "summoner#by_id" do
      response = V4.get_summoner_by_id(ctx.client, ctx.summoner_id)
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/summoner/v4/summoners/#{ctx.summoner_id}")
    end
  end

end
