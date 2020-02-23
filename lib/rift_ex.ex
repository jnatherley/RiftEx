defmodule RiftEx do
  alias RiftEx.Client
  alias Jason

  @user_agent []

  # Heavily inspired by Tentacat by edgurgel
  # https://github.com/edgurgel/tentacat

  def process_response({:ok, %Mojito.Response{body: ""} = response}), do:
    {:ok, %Mojito.Response{response|body: nil}}
  def process_response({:ok, %Mojito.Response{body: body} = response}),
    do: {:ok, %Mojito.Response{response|body: Jason.decode!(body)}}
  # If error or no return
  def process_response(response),
    do: response

  def get(path, client \\ %Client{}, query_params, options) do
    request_url = url(client, client.endpoint <> path, query_params, options)

    api_request(:get, request_url, "", authorization_header(client, @user_agent), [])
  end

  def post(path, client \\ %Client{}, body, query_params, options) do
    request_url = url(client, client.endpoint <> path, query_params, options)

    api_request(:post, request_url, body, authorization_header(client, @user_agent), [])
  end

  def api_request(method, url, body \\ "", headers \\ [], options \\ [])
  def api_request(:get, url, "", headers, options) do
    Mojito.request(:get, url, headers, "", options)
    |> process_response()
  end

  def api_request(method, url, body, headers, options) do
    Mojito.request(method, url, headers, Jason.encode!(body), options)
    |> process_response()
  end

  def authorization_header(%Client{api_key: api_key}, headers \\ []) do
    headers ++ [{"X-Riot-Token", "#{api_key}"}]
    |> IO.inspect
  end

  def url(client \\ %Client{}, path \\ "", params \\ [], options \\ [])
  def url(%Client{api_key: nil}, path, params, _options) do
    combine_params_into_uri(path, params)
  end

  def url(%Client{api_key: _api_key}, path, params, _options) when is_list(params) do
    params = List.keydelete(params, :api_key, 0)
    combine_params_into_uri(path, params)
  end

  def url(%Client{api_key: _api_key}, path, params, _options) when is_map(params) do
    params = Map.delete(params, :api_key)
    combine_params_into_uri(path, params)
  end

  def url(_client, path, params, _options), do: combine_params_into_uri(path, params)

  def combine_params_into_uri(path, params) do
    path
    |> URI.parse
    |> merge_uri_params(params)
    |> URI.to_string
  end

  @spec merge_uri_params(URI.t(), list) :: URI.t()
  defp merge_uri_params(uri, params)
  defp merge_uri_params(uri, params) when length(params) < 1, do: uri
  defp merge_uri_params(uri, params) do
    query = Map.get(uri, :query)

    query = cond do
      is_binary(query) and String.length(query) > 0 == true ->
        query |> URI.decode_query()
      true ->
        %{}
    end
    query = for {key, value} <- params, into: query do
      if is_atom(key) do
        {Atom.to_string(key), value}
      else
        {key, value}
      end
    end

    query = query |> Map.to_list |> URI.encode_query()

    %URI{uri | query: query}
  end

end
