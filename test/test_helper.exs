{:ok, _} = Application.ensure_all_started(:wallaby)
ExUnit.start
Application.put_env(:wallaby, :base_url, Babysitter.Endpoint.url)

Mix.Task.run "ecto.create", ~w(-r Babysitter.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Babysitter.Repo --quiet)

