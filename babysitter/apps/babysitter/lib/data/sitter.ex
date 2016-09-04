defmodule Babysitter.Data.Sitter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sitters" do
    field :name,         :string
    field :phone_number, :string

    timestamps
  end

  @required_fields [:name, :phone_number]

  def changeset(model, params \\ :invalid) do
    model
    |> cast(params, @required_fields, [])
  end
end
