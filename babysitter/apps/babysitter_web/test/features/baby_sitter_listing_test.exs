defmodule BabysitterWeb.SittersTest do
  use BabysitterWeb.AcceptanceCase, async: true

  test "registering a babysitter", %{session: session} do
    visit(session, "/babysitters/new")

    fill_in(session, "Name", with: "Gramma")
    fill_in(session, "Phone Number", with: "201-555-5264")
    click(session, "input[type='submit']")
    t = find(session, "body") |> text

    assert(String.contains?(t, "Registered Babysitters"))
    assert(String.contains?(t, "Gramma"))
    assert(String.contains?(t, "201-555-5264"))
  end
end
