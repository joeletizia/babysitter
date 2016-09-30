defmodule BabysitterWeb.BabysittersView do
  use BabysitterWeb.Web, :view

  def sitter_info(%{name: name, phone_number: phone_number}) do
    "#{name} - #{phone_number}"
  end
end
