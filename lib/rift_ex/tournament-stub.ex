defmodule RiftEx.TournamentStub do

  use RiftEx.Utils.Versioning, path: "lol/tournament-stub", default_version: "v4"

  def get_codes(client \\ %Client{}, body \\ "", params \\ [], options \\ []) do
    post("/codes", client, body, params, options)
  end

  def get_lobby_events_by_code(client \\ %Client{}, tournament_code, params \\ [], options \\ []) do
    get("/lobby-events/by-code/#{tournament_code}", client, params, options)
  end

  def get_providers(client \\ %Client{}, body \\ "", params \\ [], options \\ []) do
    post("/providers", client, body, params, options)
  end

  def get_tournaments(client \\ %Client{}, body \\ "", params \\ [], options \\ []) do
    post("/tournaments", client, body, params, options)
  end

  defmodule V4 do
    alias RiftEx.TournamentStub, as: TS
    @version [version: :v4]

    def get_codes(client \\ %Client{}, params \\ [], options \\ []), do:
      TS.get_codes(client, params, options ++ @version)

    def get_lobby_events_by_code(client \\ %Client{}, tournament_code, params \\ [], options \\ []) do
      TS.get_lobby_events_by_code(client, tournament_code, params, options ++ @version)
    end

    def get_providers(client \\ %Client{}, params \\ [], options \\ []), do:
      TS.get_providers(client, params, options ++ @version)

    def get_tournaments(client \\ %Client{}, params \\ [], options \\ []), do:
      TS.get_tournaments(client, params, options ++ @version)

  end

  defmodule V3 do
    alias RiftEx.TournamentStub, as: TS
    @version [version: :v3]

    def get_codes(client \\ %Client{}, params \\ [], options \\ []), do:
      TS.get_codes(client, params, options ++ @version)

    def get_lobby_events_by_code(client \\ %Client{}, tournament_code, params \\ [], options \\ []) do
      TS.get_lobby_events_by_code(client, tournament_code, params, options ++ @version)
    end

    def get_providers(client \\ %Client{}, params \\ [], options \\ []), do:
      TS.get_providers(client, params, options ++ @version)

    def get_tournaments(client \\ %Client{}, params \\ [], options \\ []), do:
      TS.get_tournaments(client, params, options ++ @version)

  end

end
