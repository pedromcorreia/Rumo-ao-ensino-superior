use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :raes_web, RaesWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :raes_web, RaesWeb.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "raes_web_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
