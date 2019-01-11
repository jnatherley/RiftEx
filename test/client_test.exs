defmodule RiotApiClientTest.Client do
  use ExUnit.Case
  alias RiotApiClient.Client
  doctest RiotApiClient.Client

  test "creates new client with endpoints" do
    
    client = Client.new("some_auth_token", "https://euw1.api.riotgames.com/")
    client2 = Client.new("some_auth_token", "https://euw1.api.riotgames.com")
    
    assert client.api_key == "some_auth_token"
    assert client.endpoint == "https://euw1.api.riotgames.com/"
    assert client2.endpoint == "https://euw1.api.riotgames.com/"
  end
end
