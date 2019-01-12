defmodule RiftEx.CassetteCase do
  use ExUnit.CaseTemplate
  alias RiftEx.Client

  using do
    quote do

      use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
      @base_url Application.fetch_env!(:rift_ex, :endpoint)

      setup_all do
        HTTPoison.start
        apikey = Application.fetch_env!(:rift_ex, :api_key)
        endpoint = @base_url
        account_name = Application.fetch_env!(:rift_ex, :test_account_name)
        account_id = Application.fetch_env!(:rift_ex, :test_account_id)
        summoner_id = Application.fetch_env!(:rift_ex, :test_id)
        [
          client: Client.new(apikey, endpoint),
          account_name: account_name,
          account_id: account_id,
          summoner_id: summoner_id,
          endpoint: endpoint,
          apikey: apikey
        ]
      end

      def join_endpoint(rem_path, url \\ "") do
        if String.length(url) > 0, do: url <> rem_path, else: @base_url <> rem_path
      end

    end
  end

end
