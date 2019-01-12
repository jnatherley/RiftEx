defmodule RiftExTest.Spectator do
  import RiftEx.Spectator

  use RiftEx.CassetteCase, async: false

  test "get_active_games", ctx do
    use_cassette "spectator#active_games_by_summoner_id" do
      response = get_active_games(ctx.client, ctx.summoner_id)
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/spectator/v4/active-games/by-summoner/#{ctx.summoner_id}")
    end
  end


  test "get_featured_games", ctx do
    use_cassette "spectator#featured_games" do
      response = get_featured_games(ctx.client)
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/spectator/v4/featured-games")
    end
  end

end
