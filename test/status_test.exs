defmodule RiftExTest.Status do
  import RiftEx.Status

  use RiftEx.CassetteCase, async: false

  test "get_shard_data", ctx do
    use_cassette "status#shard_data" do
      response = get_shard_data(ctx.client)
      assert response.status_code == 200
      assert response.request_url == join_endpoint("/lol/status/v3/shard-data")
    end
  end

end
