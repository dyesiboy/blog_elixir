# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :blog,
  ecto_repos: [Blog.Repo]

# Configures the endpoint
config :blog, BlogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "akoCV9GuES/+9YLGR/gOEaKTIG+0gp//EAJbYmHU9DInXFnVZ8CCdq/mwfEUZ9HS",
  render_errors: [view: BlogWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Blog.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :blog, Blog.Guardian,
  issuer: "blog",
  secret_key: "pDGNcSvDeCYfDB4jqdVwVcSyH3l9kca3UnT3T55hL7k/PB0Azn/62Cx7USeGq/CG"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
