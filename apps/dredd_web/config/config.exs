# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :dredd_web,
  ecto_repos: [DreddWeb.Repo]

# Configures the endpoint
config :dredd_web, DreddWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vK3y7MNfqvZN7yB1o5VpxiooaNtnutEnjUS2rTpy4zbluzscOsZynCoVQB97E/uV",
  render_errors: [view: DreddWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DreddWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :dredd_web, DreddWeb.Mailer,
  adapter: Bamboo.LocalAdapter

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWT,
  issuer: "DreddWeb",
  ttl: { 30, :days},
  verify_issuer: true,
  secret_key: "vK3y7MNfqvZN7yB1o5VpxiooaNtnutEnjUS2rTpy4zbluzscOsZynCoVQB97E/uV",
  serializer: DreddWeb.GuardianSerializer

config :ex_admin,
  repo: DreddWeb.Repo,
  module: DreddWeb,    # MyProject.Web for phoenix >= 1.3.0-rc
  modules: [
    DreddWeb.ExAdmin.Dashboard,
    DreddWeb.ExAdmin.User
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :xain, :after_callback, {Phoenix.HTML, :raw}

