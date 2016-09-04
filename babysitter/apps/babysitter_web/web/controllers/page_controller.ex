defmodule BabysitterWeb.PageController do
  use BabysitterWeb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
