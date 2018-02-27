# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :raem,
  ecto_repos: [Raem.Repo]

# Configures the endpoint
config :raem, RaemWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KqvH6nH8+hVe758i3bHxV3Gd86mmgP6ZtkvL0sb8MkRAYgVrGob7pb40H4KClZmd",
  render_errors: [view: RaemWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Raem.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
