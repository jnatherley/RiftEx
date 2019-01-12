defmodule RiftEx.Champion do

  import RiftEx
  alias RiftEx.Client

  @path "lol/platform/v3"

  def get_champion_rotations(client \\ %Client{}, params \\ [], options \\ []) do
    get("#{@path}/champion-rotations", client, params, options)
  end

end
