use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :babysitter, BabysitterWeb.Endpoint,
  secret_key_base: "feIhjnXWVlKTVR/BU3F1lVVJCz6H703HGOrbHSQ2eDUYT3xtRe5ooo+E5DWoRWug"

# Configure your database
config :babysitter, BabysitterWeb.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "babysitter_prod",
  pool_size: 20
