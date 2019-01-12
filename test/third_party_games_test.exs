defmodule RiftExTest.ThirdPartyGames do
  import RiftEx.ThirdPartyGames

  use RiftEx.CassetteCase, async: false

  test "get_third_party_code", ctx do
    use_cassette "platform#third_party_code_by_summoner_id" do
      response = get_third_party_code(ctx.client, ctx.summoner_id)
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/platform/v4/third-party-code/by-summoner/#{ctx.summoner_id}")
    end
  end


end
