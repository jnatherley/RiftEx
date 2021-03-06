defmodule RiftExTest.Match do
  import RiftEx.Match.V4
  use RiftEx.CassetteCase, async: false

  setup do
    ExVCR.Config.filter_sensitive_data("3873121535", "999")
    :ok
  end

  test "get_match", ctx do
    use_cassette "match#by_id" do
      response = get_match(ctx.client, "3873121535")
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/match/v4/matches/3873121535")
    end
  end

  test "get_timelines_by_match", ctx do
    use_cassette "match#timelines" do
      response = get_timelines_by_match(ctx.client, "3873121535")
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/match/v4/timelines/by-match/3873121535")
    end
  end

  test "get_matchlists_by_account", ctx do
    use_cassette "matchlist#by_account" do
      response = get_matchlists_by_account(ctx.client, ctx.account_id)
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/match/v4/matchlists/by-account/#{ctx.account_id}")
    end
  end

  ## No real way to test the other methods in this module.

end
