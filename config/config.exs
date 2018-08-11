# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :up,
  ecto_repos: [Up.Repo]

# Configures the endpoint
config :up, UpWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3kKG8lwB+me0i9mNfa5nhT4VAU/dqjrVWCmojkc321otN+2eylaV3ZB2gf266Kbn",
  render_errors: [view: UpWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Up.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
