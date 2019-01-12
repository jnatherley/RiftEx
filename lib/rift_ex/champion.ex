defmodule RiftEx.Champion do

  use RiftEx.Utils.Versioning, path: "lol/platform", default_version: "v3"

  def get_champion_rotations(client \\ %Client{}, params \\ [], options \\ []) do
    get("/champion-rotations", client, params, options)
  end

end
