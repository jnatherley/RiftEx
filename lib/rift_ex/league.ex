defmodule RiftEx.League do

  use RiftEx.Utils.Versioning, path: "lol/league"

  defmodule V4 do
    alias RiftEx.League, as: L

    @version [version: :v4]

    def get_challenger_leagues_by_queue(client \\ %Client{}, queue, params \\ [], options \\ []), do:
      L.get_challenger_leagues_by_queue(client, queue, params, options ++ @version)

    def get_grandmaster_leagues_by_queue(client \\ %Client{}, queue, params \\ [], options \\ []), do:
      L.get_grandmaster_leagues_by_queue(client, queue, params, options ++ @version)

    def get_master_leagues_by_queue(client \\ %Client{}, queue, params \\ [], options \\ []), do:
      L.get_master_leagues_by_queue(client, queue, params, options ++ @version)

    # Should be an encrypted summoner_id
    def get_summoner_positions_by_id(client \\ %Client{}, queue, params \\ [], options \\ []), do:
      L.get_summoner_positions_by_id(client, queue, params, options ++ @version)

    def get_league_by_id(client \\ %Client{}, queue, params \\ [], options \\ []), do:
      L.get_league_by_id(client, queue, params, options ++ @version)

  end

  defmodule V3 do
    alias RiftEx.League, as: L

    @version [version: :v3]

    def get_challenger_leagues_by_queue(client \\ %Client{}, queue, params \\ [], options \\ []), do:
      L.get_challenger_leagues_by_queue(client, queue, params, options ++ @version)

    def get_grandmaster_leagues_by_queue(client \\ %Client{}, queue, params \\ [], options \\ []), do:
      L.get_grandmaster_leagues_by_queue(client, queue, params, options ++ @version)

    def get_master_leagues_by_queue(client \\ %Client{}, queue, params \\ [], options \\ []), do:
      L.get_master_leagues_by_queue(client, queue, params, options ++ @version)

    def get_summoner_positions_by_id(client \\ %Client{}, queue, params \\ [], options \\ []), do:
      L.get_summoner_positions_by_id(client, queue, params, options ++ @version)

    def get_league_by_id(client \\ %Client{}, queue, params \\ [], options \\ []), do:
      L.get_league_by_id(client, queue, params, options ++ @version)

  end

  def get_challenger_leagues_by_queue(client \\ %Client{}, queue, params \\ [], options \\ []) do
    get("/challengerleagues/by-queue/#{queue}", client, params, options)
  end

  def get_grandmaster_leagues_by_queue(client \\ %Client{}, queue, params \\ [], options \\ []) do
    get("/grandmasterleagues/by-queue/#{queue}", client, params, options)
  end

  def get_league_by_id(client \\ %Client{}, league_id, params \\ [], options \\ []) do
    get("/leagues/#{league_id}", client, params, options)
  end

  def get_master_leagues_by_queue(client \\ %Client{}, queue, params \\ [], options \\ []) do
    get("/masterleagues/by-queue/#{queue}", client, params, options)
  end

  def get_summoner_positions_by_id(client \\ %Client{}, summoner_id, params \\ [], options \\ []) do
    get("/positions/by-summoner/#{summoner_id}", client, params, options)
  end

end
