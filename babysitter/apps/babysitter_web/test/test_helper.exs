{:ok, _} = Application.ensure_all_started(:wallaby)
ExUnit.start
Application.put_env(:wallaby, :base_url, BabysitterWeb.Endpoint.url)

