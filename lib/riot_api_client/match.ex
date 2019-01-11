defmodule RiotApiClient.Match do

  use RiotApiClient.Utils.Versioning, path: "lol/match"

  def get_match(client \\ %Client{}, match_id, params \\ [], options \\ []) do
    get("/matches/#{match_id}", client, params, options)
  end

  def get_timelines_by_match(client \\ %Client{}, match_id, params \\ [], options \\ []) do
    get("/timelines/by-match/#{match_id}", client, params, options)
  end

  def get_matchlists_by_account(client \\ %Client{}, account_id, params \\ [], options \\ []) do
    get("/matchlists/by-account/#{account_id}", client, params, options)
  end

  def get_matches_by_tournament_code(client \\ %Client{}, tournament_code, params \\ [], options \\ []) do
    get("/matches/by-tournament-code/#{tournament_code}", client, params, options)
  end

  def get_match_by_tournament_code(client \\ %Client{}, match_id, tournament_code, params \\ [], options \\ []) do
    get("/matches/#{match_id}/by-tournament-code/#{tournament_code}", client, params, options)
  end

end
