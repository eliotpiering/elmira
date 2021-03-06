# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elmira,
  ecto_repos: [Elmira.Repo]

# Configures the endpoint
config :elmira, Elmira.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yRfn+VsV6itSMwlt4r8tlULz6ZM26UmX22PhuVXRLLI27L/3g/3MC/HuKoMN1ZGl",
  render_errors: [view: Elmira.ErrorView, accepts: ~w(json)],
  pubsub: [name: Elmira.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]


config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
verify_module: Guardian.JWT,  # optional
issuer: "elmira",
  ttl: { 30, :days },
  allowed_drift: 2000,
  verify_issuer: true, # optional
secret_key: "N6NVv9bwnjPe",
  serializer: Elmira.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
