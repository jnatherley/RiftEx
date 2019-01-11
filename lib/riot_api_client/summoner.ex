defmodule RiotApiClient.Summoner do

  use RiotApiClient.Utils.Versioning, path: "lol/summoner"

  defmodule V4 do
    alias RiotApiClient.Summoner, as: S
    import RiotApiClient, only: [get: 4]

    @version [version: :v4]

    def get_summoner_by_account_id(client \\ %Client{}, encrypted_account_id, params \\ [], options \\ []), do:
      S.get_summoner_by_account_id(client, encrypted_account_id, params, options ++ @version)

    def get_summoner_by_name(client \\ %Client{}, summoner_name, params \\ [], options \\ []), do:
      S.get_summoner_by_name(client, summoner_name, params, options ++ @version)

    def get_summoner_by_id(client \\ %Client{}, encrypted_summoner_id, params \\ [], options \\ []), do:
      S.get_summoner_by_id(client, encrypted_summoner_id, params, options ++ @version)

    def get_summoner_by_puuid(client \\ %Client{}, encrypted_puuid, params \\ [], options \\ []), do:
      get("lol/summoner/v4/summoners/by-puuid/#{encrypted_puuid}", client, params, options ++ @version)

  end

  defmodule V3 do
    alias RiotApiClient.Summoner, as: S

    @version [version: :v3]

    def get_summoner_by_account_id(client \\ %Client{}, account_id, params \\ [], options \\ []), do:
      S.get_summoner_by_account_id(client, account_id, params, options ++ @version)

    def get_summoner_by_name(client \\ %Client{}, summoner_name, params \\ [], options \\ []), do:
      S.get_summoner_by_name(client, summoner_name, params, options ++ @version)

    def get_summoner_by_id(client \\ %Client{}, summoner_id, params \\ [], options \\ []), do:
      S.get_summoner_by_id(client, summoner_id, params, options ++ @version)

  end

  def get_summoner_by_account_id(client \\ %Client{}, account_id, params \\ [], options \\ []) do
    get("/summoners/by-account/#{account_id}", client, params, options)
  end

  def get_summoner_by_name(client \\ %Client{}, summoner_name, params \\ [], options \\ []) do
    get("/summoners/by-name/#{summoner_name}", client, params, options)
  end

  def get_summoner_by_id(client \\ %Client{}, summoner_id, params \\ [], options \\ []) do
    get("/summoners/#{summoner_id}", client, params, options)
  end

end
