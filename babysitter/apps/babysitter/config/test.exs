use Mix.Config
config :babysitter, ecto_repos: [Babysitter.Data.Repo]

config :babysitter, Babysitter.Data.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "joeletizia",
  database: "babysitter_test",
  hostname: "localhost",
  pool_size: 10
