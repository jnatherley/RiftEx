defmodule RiotApiClient.Utils do
  @versions %{
    v3: "v3",
    v4: "v4"
  }

  # There is a nicer more customizable way to do this
  # but in all honesty, all good apis require some changes
  def get_api_version(options) do
    case List.keyfind(options, :version, 0) do
      {:version, version} ->
        Map.get(@versions, version, "v4")
      _ ->
        "v4"
    end
  end

  defmodule Versioning do
    defmacro __using__(opts) do
      quote do
        alias RiotApiClient
        import RiotApiClient.Utils, only: [get_api_version: 1]
        alias RiotApiClient.Client

        @opts unquote(opts)
        @path Keyword.get(@opts, :path, "")

        defp get_path(options, endpath) do

          unless is_binary(@path) and String.length(@path) > 0 do
            raise ArgumentError, message: "Required argument path was not included"
          end

          version = get_api_version(options)
          @path <> "/#{version}" <> endpath
        end

        def get(path, client \\ %Client{}, params, options), do:
          RiotApiClient.get(get_path(options, path), client, params, options)

      end
    end
  end

end
