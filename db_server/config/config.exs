# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :db_server, request_node: :'request_server@127.0.0.1'
config :db_server, db_node: :'db_server@127.0.0.1'

config :db_server,
  ecto_repos: [DbServer.Repo]

# Configures the endpoint
config :db_server, DbServerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "W1YM+29MniUtD8Jvi/4NLf5vvWgQRhqWBvYz/uncCGMs2veTbgk6IBLvYTOSf6Wi",
  render_errors: [view: DbServerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DbServer.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
