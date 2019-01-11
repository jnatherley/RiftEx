defmodule RiotApiClient.Spectator do

  import RiotApiClient
  alias RiotApiClient.Client

  @path "/lol/spectator/v3"

  def get_featured_games(client \\ %Client{}, params \\ [], options \\ []) do
    get("#{@path}/featured-games", client, params, options)
  end

  def get_active_games_by_summoner_id(client \\ %Client{}, summoner_id, params \\ [], options \\ []) do
    get("#{@path}/active-games/by-summoner/#{summoner_id}", client, params, options)
  end

end
