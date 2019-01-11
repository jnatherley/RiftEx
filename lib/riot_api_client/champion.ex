defmodule RiotApiClient.Champion do

  import RiotApiClient
  alias RiotApiClient.Client

  @path "lol/platform/v3"

  def get_champion_rotations(client \\ %Client{}, params \\ [], options \\ []) do
    get("#{@path}/champion-rotations", client, params, options)
  end

end
