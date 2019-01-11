defmodule RiotApiClient.ChampionMastery do

  use RiotApiClient.Utils.Versioning, path: "lol/champion-mastery"

  def get_all_champion_masteries_by_summoner_id(client \\ %Client{}, summoner_id, params \\ [], options \\ []) do
    get("/champion-masteries/by-summoner/#{summoner_id}", client, params, options)
  end

  def get_champion_mastery_by_summoner_id(client \\ %Client{}, summoner_id, champion_id, params \\ [], options \\ []) do
    get("/champion-masteries/by-summoner/#{summoner_id}/by-champion/#{champion_id}", client, params, options)
  end

  def get_scores_by_summoner_id(client \\ %Client{}, summoner_id, params \\ [], options \\ []) do
    get("/scores/by-summoner/#{summoner_id}", client, params, options)
  end

end
