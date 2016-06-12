defmodule Babysitter.BabysittersController do
  use Babysitter.Web, :controller
  alias Babysitter.Sitter
  alias Babysitter.Repo

  def index(conn, _params) do
    conn
    |> assign(:babysitters, babysitters)
    |> render("index.html")
  end

  def new(conn, params) do
    changeset = Sitter.changeset(%Sitter{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"sitter" => sitter_params}) do
    changeset = Sitter.changeset(%Sitter{}, sitter_params)

    case Repo.insert(changeset) do
      {:ok, sitter} ->
        conn
        |> put_flash(:info, "#{sitter.name} was added as a new babysitter!")
        |> redirect(to: babysitters_path(conn, :index))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  defp babysitters do
    Repo.all(Sitter)
  end
end
