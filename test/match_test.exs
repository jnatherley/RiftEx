defmodule RiotApiClientTest.Match do
  import RiotApiClient.Match
  use RiotApiClient.CassetteCase, async: false

  setup do
    ExVCR.Config.filter_sensitive_data("3873121536", "999")
    :ok
  end

  test "get_match", ctx do
    use_cassette "match#by_id" do
      response = get_match(ctx.client, "3873121536")
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/match/v4/matches/3873121536")
    end
  end

  test "get_timelines_by_match", ctx do
    use_cassette "match#timelines" do
      response = get_timelines_by_match(ctx.client, "3873121536")
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/match/v4/timelines/by-match/3873121536")
    end
  end

  test "get_matchlists_by_account", ctx do
    use_cassette "matchlist#by_account" do
      response = get_matchlists_by_account(ctx.client, ctx.account_id)
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/match/v4/matchlists/by-account/#{ctx.account_id}")
    end
  end

end
