defmodule Babysitter.Sitter do
  use Babysitter.Web, :model

  schema "sitters" do
    field :name,         :string
    field :phone_number, :string

    timestamps
  end

  def changeset(model, params \\ :invalid) do
    model
    |> cast(params, ~w(name phone_number), [])
  end
end
