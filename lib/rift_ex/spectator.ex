defmodule RiftEx.Spectator do

  use RiftEx.Utils.Versioning, path: "lol/spectator"

  def get_active_games(client \\ %Client{}, encrypted_summoner_id, params \\ [], options \\ []) do
    get("/active-games/by-summoner/#{encrypted_summoner_id}", client, params, options)
  end

  def get_featured_games(client \\ %Client{}, params \\ [], options \\ []) do
    get("/featured-games", client, params, options)
  end

end
