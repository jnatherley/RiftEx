use Mix.Config

test_id = "TEST_RIOT_SUMMONER_ID"
test_puuid = "TEST_RIOT_PUUID"
test_account_id = "TEST_ACCOUNT_ID"
test_account_name = "TEST_RIOT_SUMMONER_NAME"
test_api_key = "TEST_API_KEY"

config :exvcr, [
  vcr_cassette_library_dir: "test/fixtures/vcr_cassettes",
  # custom_cassette_library_dir: "test/fixtures/custom_cassettes",
  filter_sensitive_data: [
    [pattern: test_account_name, placeholder: "FooFighter"],
    [pattern: test_account_id, placeholder: "***"],
    [pattern: test_id, placeholder: "***"],
    [pattern: test_puuid, placeholder: "***"]
  ],
  filter_url_params: true,
  filter_request_headers: ["X-Riot-Token"],
  response_headers_blacklist: [
    "X-Method-Rate-Limit-Count",
    "X-Method-Rate-Limit",
    "X-App-Rate-Limit-Count",
    "X-Method-Rate-Limit",
    "X-Riot-Edge-Trace-Id",
    "CF-RAY"
  ]
]

config :riot_api_client,
  api_key: test_api_key,
  test_account_name: test_account_name,
  test_account_id: test_account_id,
  test_id: test_id,
  test_puuid: test_puuid
