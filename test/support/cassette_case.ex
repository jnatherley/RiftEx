defmodule RiotApiClient.CassetteCase do
  use ExUnit.CaseTemplate
  alias RiotApiClient.Client

  using do
    quote do

      use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
      @base_url "https://euw1.api.riotgames.com"

      setup_all do
        HTTPoison.start
        apikey = Application.fetch_env!(:riot_api_client, :api_key)
        endpoint = @base_url
        account_name = Application.fetch_env!(:riot_api_client, :test_account_name)
        account_id = Application.fetch_env!(:riot_api_client, :test_account_id)
        summoner_id = Application.fetch_env!(:riot_api_client, :test_id)
        [
          client: Client.new(apikey, endpoint),
          account_name: account_name,
          account_id: account_id,
          summoner_id: summoner_id,
          endpoint: endpoint,
          apikey: apikey
        ]
      end

      def join_endpoint(rem_path) do
        @base_url <> rem_path
      end

    end
  end

end
