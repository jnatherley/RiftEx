defmodule RiftEx.Client do

  defstruct [
    :api_key,
    :endpoint
  ]

  def new(params) when is_map(params), do: create_client(params)
  def new([api_key: api_key, endpoint: endpoint] = params) when is_list(params), do:
    create_client(%{
      api_key: api_key,
      endpoint: endpoint
    })

  def new(api_key \\ "", endpoint \\ ""), do:
    create_client(%{
      api_key: api_key,
      endpoint: endpoint
    })

  defp add_trailing_slash(url), do:
    if String.ends_with?(url, "/"), do: url, else: url <> "/"

  defp create_client(%{api_key: api_key, endpoint: endpoint} = params) when is_nil(api_key) do
    if (String.length(endpoint) < 1), do: raise ArgumentError, message: "Invalid length for endpoint"

    struct(__MODULE__, %{params | endpoint: add_trailing_slash(params.endpoint)})
  end

  defp create_client(%{api_key: api_key, endpoint: endpoint} = params) when is_binary(api_key) do
    if (String.length(api_key) < 1), do: raise ArgumentError, message: "Invalid length for api_key"
    if (String.length(endpoint) < 1), do: raise ArgumentError, message: "Invalid length for endpoint"

    struct(__MODULE__, %{params | endpoint: add_trailing_slash(params.endpoint)})
  end

end
