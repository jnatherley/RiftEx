defmodule RiotApiClientTest.Champion do
  import RiotApiClient.Champion

  use RiotApiClient.CassetteCase, async: false

  setup do
    ExVCR.Config.filter_sensitive_data("3873121536", "999")
    :ok
  end

  test "get_champion_rotations", ctx do
    use_cassette "champion#rotations" do
      response = get_champion_rotations(ctx.client)
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/platform/v3/champion-rotations")
    end
  end

end
