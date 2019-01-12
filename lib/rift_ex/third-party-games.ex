defmodule RiftEx.ThirdPartyGames do

  use RiftEx.Utils.Versioning, path: "lol/platform", default_version: "v4"

  def get_third_party_code(client \\ %Client{}, encrypted_summoner_id, params \\ [], options \\ []) do
    get("/third-party-code/by-summoner/#{encrypted_summoner_id}", client, params, options)
  end

  defmodule V4 do
    alias RiftEx.ThirdPartyGames, as: TPG
    @version [version: :v4]

    def get_third_party_code(client \\ %Client{}, encrypted_summoner_id, params \\ [], options \\ []), do:
      TPG.get_third_party_code(client, encrypted_summoner_id, params, options ++ @version)

  end

  defmodule V3 do
    alias RiftEx.ThirdPartyGames, as: TPG
    @version [version: :v3]

    def get_third_party_code(client \\ %Client{}, encrypted_summoner_id, params \\ [], options \\ []), do:
      TPG.get_third_party_code(client, encrypted_summoner_id, params, options ++ @version)

  end

end
