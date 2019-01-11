defmodule RiotApiClientTest do
  use ExUnit.Case
  doctest RiotApiClient
  alias RiotApiClient.Client

  use RiotApiClient.CassetteCase, async: true

  test "does create a client",  ctx do
    created_client_1 = Client.new([api_key: ctx.apikey, endpoint: ctx.endpoint])
    created_client_2 = Client.new(%{api_key: ctx.apikey, endpoint: ctx.endpoint})
    created_client_3 = Client.new(ctx.apikey, ctx.endpoint)

    assert ctx.client == created_client_1
    assert ctx.client == created_client_2
    assert ctx.client == created_client_3

  end

  test "does raise error when fields are empty", ctx do

    assert_raise ArgumentError, "Invalid length for api_key", fn ->
      Client.new([api_key: "", endpoint: ctx.endpoint ])
    end

    assert_raise ArgumentError, "Invalid length for endpoint", fn ->
      Client.new([api_key: ctx.apikey, endpoint: ""])
    end

  end

  test "does add query params to url", ctx do
    path = ctx.client.endpoint <> "/lol/summoner/v3/summoners/by-name/RiotSchmick"
    new_client = Client.new(%{endpoint: @base_url, api_key: nil})

    assert RiotApiClient.url(new_client, path, [api_key: ctx.apikey]) == path <> "?api_key=#{ctx.apikey}"
    assert RiotApiClient.url(ctx.client, path, [api_key: ctx.apikey]) == path
    assert RiotApiClient.url(ctx.client, path) == path
  end

  test "does combine Authorization header into base_headers", ctx do
    base_headers = [{"Accept-Language", "en-US,en;q=0.9,es;q=0.8"}]
    assert RiotApiClient.authorization_header(ctx.client, base_headers) == base_headers ++ [{"X-Riot-Token", ctx.apikey}]
  end

end
