defmodule BabysitterWeb.BabysittersController do
  use BabysitterWeb.Web, :controller

  def index(conn, _params) do
    assign(conn, :registered_sitters, Babysitter.Sitter.registered_sitters)
    |> render "index.html"
  end

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"babysitter" => sitter_params}) do
    Babysitter.Sitter.register_sitter(sitter_params["name"], sitter_params["phone_number"])
    redirect conn, to: "/"
  end
end
