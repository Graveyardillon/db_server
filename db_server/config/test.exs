use Mix.Config

# Configure your database
config :db_server, DbServer.Repo,
  username: "postgres",
  password: "0562",
  database: "db_server_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :db_server, DbServerWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
