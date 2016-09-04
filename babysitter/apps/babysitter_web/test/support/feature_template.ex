defmodule BabysitterWeb.AcceptanceCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      import BabysitterWeb.Router.Helpers
    end
  end

  setup tags do
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
