defmodule RiftEx.Status do

  use RiftEx.Utils.Versioning, path: "lol/status", default_version: "v3"

  def get_shard_data(client \\ %Client{}, params \\ [], options \\ []) do
    get("/shard-data", client, params, options)
  end

end
