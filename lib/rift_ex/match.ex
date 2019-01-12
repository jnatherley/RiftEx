defmodule RiftEx.Match do

  use RiftEx.Utils.Versioning, path: "lol/match", default_version: "v4"

  defmodule V4 do
    alias RiftEx.Match, as: M
    @version [version: :v4]

    def get_match(client \\ %Client{}, match_id, params \\ [], options \\ []), do:
      M.get_match(client, match_id, params, options ++ @version)

    def get_timelines_by_match(client \\ %Client{}, match_id, params \\ [], options \\ []), do:
      M.get_timelines_by_match(client, match_id, params, options ++ @version)

    def get_matchlists_by_account(client \\ %Client{}, encrypted_account_id, params \\ [], options \\ []), do:
      M.get_matchlists_by_account(client, encrypted_account_id, params, options ++ @version)

    def get_matches_by_tournament_code(client \\ %Client{}, tournament_code, params \\ [], options \\ []), do:
      M.get_matches_by_tournament_code(client, tournament_code, params, options ++ @version)

    def get_match_by_tournament_code(client \\ %Client{}, match_id, tournament_code, params \\ [], options \\ []), do:
      M.get_match_by_tournament_code(client, match_id, tournament_code, params, options ++ @version)

  end

  defmodule V3 do
    alias RiftEx.Match, as: M
    @version [version: :v3]

    def get_match(client \\ %Client{}, match_id, params \\ [], options \\ []), do:
      M.get_match(client, match_id, params, options ++ @version)

    def get_timelines_by_match(client \\ %Client{}, match_id, params \\ [], options \\ []), do:
      M.get_timelines_by_match(client, match_id, params, options ++ @version)

    def get_matchlists_by_account(client \\ %Client{}, account_id, params \\ [], options \\ []), do:
      M.get_matchlists_by_account(client, account_id, params, options ++ @version)

    def get_matches_by_tournament_code(client \\ %Client{}, tournament_code, params \\ [], options \\ []), do:
      M.get_matches_by_tournament_code(client, tournament_code, params, options ++ @version)

    def get_match_by_tournament_code(client \\ %Client{}, match_id, tournament_code, params \\ [], options \\ []), do:
      M.get_match_by_tournament_code(client, match_id, tournament_code, params, options ++ @version)

  end

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
