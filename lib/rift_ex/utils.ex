defmodule RiftEx.Utils do

  defmodule Versioning do
    defmacro __using__(opts) do
      quote do
        alias RiftEx
        alias RiftEx.Client

        @opts unquote(opts)
        @path Keyword.get(@opts, :path, "")
        @default_version Keyword.get(@opts, :default_version, "v4")


        @versions %{
          v3: "v3",
          v4: "v4"
        }

        # There is a nicer more customizable way to do this
        # but in all honesty, all good apis require some changes
        def get_api_version(options) do
          case List.keyfind(options, :version, 0) do
            {:version, version} ->
              Map.get(@versions, version, @default_version)
            _ ->
              @default_version
          end
        end

        defp get_path(options, endpath) do

          unless is_binary(@path) and String.length(@path) > 0 do
            raise ArgumentError, message: "Required argument path was not included"
          end

          version = get_api_version(options)
          @path <> "/#{version}" <> endpath
        end

        def get(path, client \\ %Client{}, params, options), do:
          RiftEx.get(get_path(options, path), client, params, options)

        def post(path, client \\ %Client{}, body, params, options), do:
          RiftEx.post(get_path(options, path), client, body, params, options)

      end
    end
  end
end
